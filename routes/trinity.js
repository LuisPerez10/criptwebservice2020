const { Router } = require('express');

const { check } = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');

const { trinity, retornaImagen } = require('../controllers/trinity');
const router = Router();


router.post('/', [
        check('value', 'El value del cifrado es requerido').not().isEmpty(),
        check('tipo', 'El tipo de cifrado es requerido').not().isEmpty(),
        validarCampos
    ],
    trinity);

router.get('/:foto',
    retornaImagen);





module.exports = router;