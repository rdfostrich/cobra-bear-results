#!/usr/bin/env node
/* Make averages for all OSTRICH query results */

let fs = require('fs');
let csvParser = require('csv-parser');
let csvWriter = require('csv-write-stream');

let dir = process.argv[2];
let OFFSETS = [
    '2',
    '4',
    '8',
    '16',
    '32',
    '64',
    '128',
    '256',
    '512',
    '1024',
    '2048',
    '4096'
];

let columnsStaticVm = [
    'patch',
    'offset',
    'version'
];
let columnsStaticDm = [
    'patch_start',
    'patch_end',
    'offset',
    'versionstart',
    'versionend'
];
let columnsStaticVq = [
    'offset'
];
let columsStaticIndex = {
    'vm': columnsStaticVm,
    'dm': columnsStaticDm,
    'vq': columnsStaticVq,
};
let medianIndex = {
    'vm': {},
    'dm': {},
    'vq': {},
};

let type;

let countdown = 0;
OFFSETS.forEach((offset) => {
    countdown++;
    fs.readdir(dir + offset, (err, files) => {
        if (err) return;
        countdown++;
        
        files.forEach(file => {
            type = null;
            if (file.indexOf('_median_vq') == 0 || file.indexOf('vq') == 0) {
                type = 'vq';
            } else if (file.indexOf('_median_dm') == 0 || file.indexOf('dm') == 0) {
                type = 'dm';
            } else if (file.indexOf('_median_vm') == 0 || file.indexOf('vm') == 0) {
                type = 'vm';
            }
            if (type) {
                
            let medianData = medianIndex[type];
            let columnsStatic = columsStaticIndex[type];
            countdown++;
            file = dir + offset + '/' + file;
            
            let row = 0;
            let medianRow = medianIndex[type][offset];
            if (!medianRow) {
                medianRow = {};
                medianIndex[type][offset] = medianRow;
            }
            fs.createReadStream(file)
                .pipe(csvParser())
                .on('data', (data) => {
                    Object.keys(data).forEach((key) => {
                        let value = parseFloat(data[key]);
                        if (columnsStatic.indexOf(key) >= 0) {
                            medianRow[key] = value;
                        } else {
                            if (!medianRow[key]) medianRow[key] = [];
                            medianRow[key].push(value);
                        }
                    });
                })
                .on('end', () => {
                    if (--countdown === 0) {
                        console.log('end');
                        ['vm', 'dm', 'vq'].forEach((type) => {
                            let writer = csvWriter();
                            writer.pipe(fs.createWriteStream(dir + '/_median_' + type + '.csv'));
                            OFFSETS.forEach((offset) => {
                                let row = medianIndex[type][offset];
                                //console.log(type + " " + offset);
                                Object.keys(row).forEach((key) => {
                                    if (columsStaticIndex[type].indexOf(key) < 0) {
                                        row[key] = row[key].sort((a, b) => a - b)[Math.floor(row[key].length / 2)];
                                    }
                                });
                                row.offset = offset;
                                writer.write(row);
                            });
                            writer.end();
                        });
                    }
                });
            }
        });
        countdown--;
    });
    countdown--;
});

