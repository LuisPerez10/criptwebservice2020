const { spawn } = require('child_process');

const zigzag = (req, res) => {
    const { key, value, tipo } = req.body;
    // console.log('key', key, 'value', value, 'tipo', tipo);

    tipoLC = tipo.toLowerCase();

    const proc = spawn('perl', [`RailFence.pl "${tipoLC}" "${value}" "${key}"`], { shell: true });
    var dataToSend;
    proc.stdout.on('data', (data) => {
        dataToSend = data.toString();
    });
    proc.on('close', (code) => {
        res.json({
            ok: true,
            value: dataToSend
        });
    });


}

module.exports = {
    zigzag
}