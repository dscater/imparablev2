import { useForm } from "@inertiajs/vue3";
import { onMounted, ref } from "vue";

export const useProductos = () => {
    const initialState = {
        id: 0,
        codigo: "",
        nombre: "",
        tipo: "",
        categoria_id: "",
        marca_id: "",
        unidad_medida_id: "",
        caracteristicas: "",
        precio: 0,
        precio_compra: 0,
        duracion_dias: 1,
        horario: "",
        hora_ini: "",
        hora_fin: "",
        indefinido: "",
        stock_min: "",
        imagen: "",
        fecha_registro: "",
        activo: 1,
        _method: "POST",
    };

    const form = useForm({ ...initialState });

    const setProducto = (item = null) => {
        form.clearErrors();
        form.reset();
        Object.assign(form, item);
        form._method = "PUT";
    };

    const limpiarProducto = () => {
        form.clearErrors();
        form.reset();
        form.defaults({ ...initialState });
    };

    onMounted(() => {});

    return {
        form,
        setProducto,
        limpiarProducto,
    };
};
