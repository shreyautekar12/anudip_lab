const fs=require('fs');

const source='source.txt';
const destination='destination.txt';

if (fs.existsSync(source)){
    fs.copyFile(source, destination, (err)=>{
        if (err){
            console.error('Error copying file:', err);
        }else{
            console.log('File copied successfully');
        }
    });
}else{
    console.log('Source file does not exist');
}