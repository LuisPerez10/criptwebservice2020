const path = require('path');
const fs = require('fs');
const { spawn } = require('child_process');



const trinity = (req, res) => {
    const { value, tipo } = req.body;
    console.log('value', value, 'tipo', tipo);

    tipoLC = tipo.toLowerCase();
    valueUC = value.toUpperCase();

    if (tipoLC == "decode") {
        valueUC = [...valueUC].toString().replace(/,/g, " ");
    } else
        valueUC = `"${valueUC}"`;

    const proc = spawn('perl', [`trinity.pl "${tipoLC}" ${valueUC}`], { shell: true });
    var dataToSend;
    proc.stdout.on('data', (data) => {
        console.log('Pipe data from python script ...');
        dataToSend = data.toString();
    });
    proc.on('close', (code) => {
        console.log(`child process close all stdio with code ${code}`);
        console.log(dataToSend);
        res.json({
            ok: true,
            value: [...dataToSend]
        });
    });




}

const retornaImagen = (req, res) => {

    const foto = req.params.foto;
    console.log(foto);

    // const pathImg = path.join(__dirname, `../Screenshots/${foto}`);
    const pathImg = path.join(__dirname, `../Screenshots/${foto}.png`);
    console.log('pathImg');
    console.log(pathImg);
    // imagen por defecto
    if (fs.existsSync(pathImg)) {
        res.sendFile(pathImg);
    } else {
        const pathImg = path.join(__dirname, `../Screenshots/B.png`);
        res.sendFile(pathImg);
    }

}
module.exports = {
    trinity,
    retornaImagen
}