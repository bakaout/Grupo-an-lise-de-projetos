document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    const users = JSON.parse(localStorage.getItem('users')) || [];

    const user = users.find(u => u.email === email && u.password === password);

    if (user) {
        window.location.href = 'selecionarPet.html'; // Redirecionar para a página de seleção de pet
    } else {
        const errorDiv = document.getElementById('login-error');
        errorDiv.textContent = 'Usuário ou senha incorretos.';
        errorDiv.style.display = 'block';
    }
});
