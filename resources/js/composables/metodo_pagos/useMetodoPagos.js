import { useForm } from "@inertiajs/vue3";
import { onMounted, ref } from "vue";

export const useMetodoPagos = () => {
    const initialState = {
        id: 0,
        nombre: "",
        descripcion: "",
        icon: "",
        _method: "POST",
    };

    const form = useForm({ ...initialState });

    const setMetodoPago = (item = null) => {
        form.clearErrors();
        form.reset();
        Object.assign(form, item);
        form._method = "PUT";
    };

    const limpiarMetodoPago = () => {
        form.clearErrors();
        form.reset();
        form.defaults({ ...initialState });
    };

    onMounted(() => {});

    return {
        form,
        setMetodoPago,
        limpiarMetodoPago,
    };
};
