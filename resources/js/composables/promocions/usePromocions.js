import { useForm } from "@inertiajs/vue3";
import { onMounted, ref } from "vue";
import { useDate } from "../useDate";

export const usePromocions = () => {
    const initialState = {
        id: 0,
        nombre: "",
        descripcion: "",
        tipo: "TODOS",
        condicion: "NORMAL",
        indefinido: 0,
        fecha_ini: useDate().getFechaActual(),
        fecha_fin: "",
        cantidad: "",
        porcentaje_monto: "PORCENTAJE",
        porcentaje: 0,
        monto: 0,
        fecha_registro: "",
        user_id: "",
        estado: "",
        _method: "POST",
    };

    const form = useForm({ ...initialState });

    const setPromocion = (item = null) => {
        form.clearErrors();
        form.reset();
        Object.assign(form, item);
        form._method = "PUT";
    };

    const limpiarPromocion = () => {
        form.clearErrors();
        form.reset();
        form.defaults({ ...initialState });
    };

    onMounted(() => {});

    return {
        form,
        setPromocion,
        limpiarPromocion,
    };
};
