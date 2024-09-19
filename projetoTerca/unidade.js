document.addEventListener('DOMContentLoaded', () => {
    // Função para garantir que apenas uma unidade possa ser selecionada
    function handleSingleSelection() {
        const unitCheckboxes = document.querySelectorAll('input[name="unit"]');
        
        unitCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', () => {
                if (checkbox.checked) {
                    unitCheckboxes.forEach(otherCheckbox => {
                        if (otherCheckbox !== checkbox) {
                            otherCheckbox.checked = false;
                        }
                    });
                }
            });
        });
    }

    handleSingleSelection();

    // Função para armazenar a seleção da unidade no localStorage
    function storeSelection() {
        const selectedUnit = document.querySelector('input[name="unit"]:checked');
        const selection = {
            unit: selectedUnit ? selectedUnit.value : null
        };

        localStorage.setItem('unitSelection', JSON.stringify(selection));
    }

    // Adicionar evento ao botão de continuar
    document.querySelector('.continue-button').addEventListener('click', (event) => {
        event.preventDefault(); // Prevenir o comportamento padrão do link
        storeSelection(); // Salvar a seleção
        alert('As informações foram salvas.'); // Exibir alerta

        // Redirecionar após o alerta
        setTimeout(() => {
            window.location.href = './agendamento.html'; // Redirecionar para a nova página
        }, 500); // Atraso para garantir que o alerta seja exibido
    });
});
