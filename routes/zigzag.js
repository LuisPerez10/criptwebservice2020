const { Router } = require('express');

const { check } = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');

const { zigzag } = require('../controllers/zigzag');
const router = Router();


router.post('/', [
        check('value', 'El value del cifrado es requerido').not().isEmpty(),
        check('key', 'El key del cifrado es requerido').not().isEmpty(),
        check('tipo', 'El tipo de cifrado es requerido').not().isEmpty(),
        validarCampos
    ],
    zigzag);



module.exports = router;