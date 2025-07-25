const fs=require('fs');

const file1='file1.txt';
const file2='file2.txt';
const mergedFile='merged.txt';

try{
    const data1=fs.readFileSync(file1, 'utf8');
    const data2=fs.readFileSync(file2, 'utf8');

    fs.writeFileSync(mergedFile, data1 + '\n' + data2);
    console.log('Files merged successfully');
}catch(err){
    console.error('Error:', err);
}