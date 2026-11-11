import { useForm } from "@inertiajs/vue3";
import { onMounted, ref } from "vue";

export const useClientes = () => {
    const initialState = {
        id: 0,
        nombre: "",
        paterno: "",
        materno: "",
        ci: "",
        ci_exp: "",
        fecha_nac: "",
        dir: "",
        fono: "",
        fono_ref: "",
        correo: "",
        foto: "",
        user_id: "",
        fecha_registro: "",
        status: "",
        _method: "POST",
    };

    const form = useForm({ ...initialState });

    const setCliente = (item = null) => {
        form.clearErrors();
        form.reset();
        Object.assign(form, item);
        form._method = "PUT";
    };

    const limpiarCliente = () => {
        form.clearErrors();
        form.reset();
        form.defaults({ ...initialState });
    };

    onMounted(() => {});

    return {
        form,
        setCliente,
        limpiarCliente,
    };
};
