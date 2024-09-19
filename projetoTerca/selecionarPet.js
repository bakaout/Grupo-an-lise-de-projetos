document.addEventListener('DOMContentLoaded', () => {
    const petsList = document.getElementById('pets-list');
    const pets = JSON.parse(localStorage.getItem('pets')) || [];

    if (pets.length === 0) {
        petsList.innerHTML = '<p>Nenhum pet cadastrado</p>';
        return;
    }

    petsList.innerHTML = pets.map(pet => `
        <div class="pet-item">
            <label>
                <input type="radio" name="pet" value="${pet.name}">
                ${pet.name}
            </label>
        </div>
    `).join('');

    petsList.innerHTML += `
        <button id="select-pet" class="register-pet-button">Selecionar Pet</button>
    `;

    document.getElementById('select-pet').addEventListener('click', () => {
        const selectedPet = document.querySelector('input[name="pet"]:checked');
        if (selectedPet) {
            window.location.href = 'servico.html'; // Redireciona para a página de serviço
        } else {
            alert('Por favor, selecione um pet.');
        }
    });
});
