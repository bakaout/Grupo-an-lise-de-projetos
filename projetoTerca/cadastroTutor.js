document.querySelector('.register-form').addEventListener('submit', function(event) {
    event.preventDefault();

    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const street = document.getElementById('street').value;
    const number = document.getElementById('number').value;
    const cep = document.getElementById('cep').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm-password').value;

    // Verifica se todos os campos estão preenchidos
    if (!name || !email || !phone || !street || !number || !cep || !password || !confirmPassword) {
        displayError('Todos os campos devem estar preenchidos.');
        return;
    }

    // Verifica se as senhas coincidem
    if (password !== confirmPassword) {
        displayError('As senhas não coincidem.');
        return;
    }

    const users = JSON.parse(localStorage.getItem('users')) || [];

    // Verifica se o email já está cadastrado
    if (users.find(u => u.email === email)) {
        displayError('Email já cadastrado.');
        return;
    }

    // Adiciona o novo usuário
    users.push({ name, email, phone, street, number, cep, password });
    localStorage.setItem('users', JSON.stringify(users));

    alert('Cadastro realizado com sucesso!');
    window.location.href = 'login.html'; // Redirecionar para a página de login
});

function displayError(message) {
    const errorDiv = document.getElementById('register-error');
    errorDiv.textContent = message;
    errorDiv.style.display = 'block';
}
