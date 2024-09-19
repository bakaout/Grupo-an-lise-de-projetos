// servico.js
document.addEventListener('DOMContentLoaded', () => {
    // Seletores para os checkboxes de banho e tosa
    const bathCheckboxes = document.querySelectorAll('input[name="service"][id^="banho"]');
    const groomingCheckboxes = document.querySelectorAll('input[name="service"][id^="tosa"]');
    
    // Função para garantir seleção única para banhos e tosa
    function handleSingleSelection(checkboxes) {
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', () => {
                if (checkbox.checked) {
                    checkboxes.forEach(otherCheckbox => {
                        if (otherCheckbox !== checkbox) {
                            otherCheckbox.checked = false;
                        }
                    });
                }
            });
        });
    }

    // Aplicar a função de seleção única
    handleSingleSelection(bathCheckboxes);
    handleSingleSelection(groomingCheckboxes);
    
    // Adicionar lógica para permitir múltiplas seleções de serviços adicionais
    const additionalServiceCheckboxes = document.querySelectorAll('input[name="additional-service"]');
    additionalServiceCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', () => {
            // Aqui você pode adicionar lógica se precisar para serviços adicionais
            // No momento, o código permite múltiplas seleções sem restrições
        });
    });

    // Função para armazenar as seleções no localStorage
    function storeSelections() {
        const selectedBath = document.querySelector('input[name="service"][id^="banho"]:checked');
        const selectedGrooming = document.querySelector('input[name="service"][id^="tosa"]:checked');
        const additionalServices = Array.from(document.querySelectorAll('input[name="additional-service"]:checked'))
            .map(checkbox => checkbox.value);

        const selections = {
            bath: selectedBath ? selectedBath.value : null,
            grooming: selectedGrooming ? selectedGrooming.value : null,
            additionalServices: additionalServices
        };

        localStorage.setItem('petServiceSelections', JSON.stringify(selections));
    }

    // Adicionar evento ao botão de reserva
    document.getElementById('reserve-button').addEventListener('click', storeSelections);

    // Adicionar evento ao botão de continuar
    document.getElementById('continue-button').addEventListener('click', (event) => {
        event.preventDefault(); // Prevenir o comportamento padrão do link
        storeSelections(); // Salvar as seleções
        alert('As informações foram salvas.'); // Exibir alerta

        // Redirecionar após o alerta
        setTimeout(() => {
            window.location.href = './unidade.html'; // Redirecionar para a nova página
        }, 500); // Atraso para garantir que o alerta seja exibido
    });
});
