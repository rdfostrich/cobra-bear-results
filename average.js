#!/usr/bin/env node
/* Make averages for all OSTRICH query results */

let fs = require('fs');
let csvParser = require('csv-parser');
let csvWriter = require('csv-write-stream');

let dir = process.argv[2];
let SUBDIRS = [
    'o-high',
    'o-low',
    'p-high',
    'p-low',
    'po-high',
    'po-low',
    's-high',
    's-low',
    'so-low',
    'sp-high',
    'sp-low',
    'spo'
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
    'vm': [],
    'dm': [],
    'vq': [],
};
let averageIndex = {
    'vm': [],
    'dm': [],
    'vq': [],
};
let minIndex = {
    'vm': [],
    'dm': [],
    'vq': [],
};
let maxIndex = {
    'vm': [],
    'dm': [],
    'vq': [],
};
let countIndex = {
    'vm': 0,
    'dm': 0,
    'vq': 0,
};

let type;

let countdown = 0;
SUBDIRS.forEach((subDir) => {
    countdown++;
    fs.readdir(dir + subDir, (err, files) => {
        countdown++;
        if (err) throw err;
        
        files.forEach(file => {
            type = null;
            if (file.indexOf('_average_vq') == 0 || file.indexOf('vq') == 0) {
                type = 'vq';
            } else if (file.indexOf('_average_dm') == 0 || file.indexOf('dm') == 0) {
                type = 'dm';
            } else if (file.indexOf('_average_vm') == 0 || file.indexOf('vm') == 0) {
                type = 'vm';
            }
            if (type) {
            let medianData = medianIndex[type];
            let averageData = averageIndex[type];
            let minData = minIndex[type];
            let maxData = maxIndex[type];
            let columnsStatic = columsStaticIndex[type];
            countIndex[type]++;
            countdown++;
            file = dir + subDir + '/' + file;
            
            let row = 0;
            fs.createReadStream(file)
                .pipe(csvParser())
                .on('data', (data) => {
                    let medianRow = medianData[row];
                    let averageRow = averageData[row];
                    let minRow = minData[row];
                    let maxRow = maxData[row];
                    if (!medianRow) {
                        medianRow = (medianData[row] = {});
                        averageRow = (averageData[row] = {});
                        minRow = (minData[row] = {});
                        maxRow = (maxData[row] = {});
                    }
                    Object.keys(data).forEach((key) => {
                        let value = parseFloat(data[key]);
                        if (columnsStatic.indexOf(key) >= 0) {
                            medianRow[key] = value;
                            averageRow[key] = value;
                            minRow[key] = value;
                            maxRow[key] = value;
                        } else {
                            if (!medianRow[key]) medianRow[key] = [];
                            medianRow[key].push(value);
                            
                            if (!averageRow[key]) averageRow[key] = 0;
                            averageRow[key] += value;
                            
                            if (!minRow[key]) minRow[key] = value;
                            else minRow[key] = Math.min(minRow[key], value);
                            
                            if (!maxRow[key]) maxRow[key] = value;
                            else maxRow[key] = Math.max(maxRow[key], value);
                        }
                    });
                    row++;
                })
                .on('end', () => {
                    if (--countdown === 0) {
                        console.log('end');
                        
                        ['vm', 'dm', 'vq'].forEach((type) => {
                            let writer = csvWriter();
                            writer.pipe(fs.createWriteStream(dir + '/_average_' + type + '.csv'));
                            averageIndex[type].forEach((row) => {
                                Object.keys(row).forEach((key) => {
                                    if (columsStaticIndex[type].indexOf(key) < 0) {
                                        row[key] /= countIndex[type];
                                    }
                                });
                                writer.write(row);
                            });
                            writer.end();
                            
                            writer = csvWriter();
                            writer.pipe(fs.createWriteStream(dir + '/_median_' + type + '.csv'));
                            medianIndex[type].forEach((row) => {
                                Object.keys(row).forEach((key) => {
                                    if (columsStaticIndex[type].indexOf(key) < 0) {
                                        row[key] = row[key].sort((a, b) => a - b)[row[key].length / 2];
                                    }
                                });
                                writer.write(row);
                            });
                            writer.end();
                            
                            writer = csvWriter();
                            writer.pipe(fs.createWriteStream(dir + '/_min_' + type + '.csv'));
                            minIndex[type].forEach((row) => {
                                writer.write(row);
                            });
                            writer.end();
                            
                            writer = csvWriter();
                            writer.pipe(fs.createWriteStream(dir + '/_max_' + type + '.csv'));
                            maxIndex[type].forEach((row) => {
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

