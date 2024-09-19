document.querySelector('.pet-form').addEventListener('submit', function(event) {
    event.preventDefault();

    const name = document.getElementById('name').value;
    const breed = document.getElementById('breed').value;
    const size = document.getElementById('size').value;
    const gender = document.getElementById('gender').value;
    const temperament = document.getElementById('temperament').value;
    const birthdate = document.getElementById('birthdate').value;
    const observations = document.getElementById('observations').value;

    if (!name || !breed || !size || !gender || !temperament || !birthdate) {
        alert('Por favor, preencha todos os campos obrigatórios.');
        return;
    }

    const pets = JSON.parse(localStorage.getItem('pets')) || [];
    pets.push({ name, breed, size, gender, temperament, birthdate, observations });
    localStorage.setItem('pets', JSON.stringify(pets));

    alert('Pet cadastrado com sucesso!');
    window.location.href = 'selecionarPet.html'; // Redireciona para a página de seleção de pet
});
