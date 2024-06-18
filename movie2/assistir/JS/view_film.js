document.addEventListener("DOMContentLoaded", function() {
    const filmeId = localStorage.getItem('id');
    if (filmeId) {
        fetchFilme(filmeId);
    } else {
        alert('Filme não encontrado!');
        window.location.href = 'index.html'; // Redireciona para a página inicial
    }
});

function fetchFilme(id) {
    $.ajax({
        type: 'GET',
        url: `../PHP/view_film.php?id=${id}`,
        dataType: 'json',
        success: function(data) {
            if (data) {
                exibirFilme(data);
            } else {
                $('#filmeDetalhes').html('<p>Filme não encontrado.</p>');
            }
        },
        error: function(xhr, status, error) {
            console.error('Erro ao buscar os detalhes do filme:', xhr.responseText);
            $('#filmeDetalhes').html('<p>Erro ao carregar os detalhes do filme.</p>');
        }
    });
}

function exibirFilme(filme) {
    const detalhes = `
        <h3>${filme.nome}</h3>
        <div class="video-container">
            <video controls>
                <source src="${filme.video}" type="video/mp4">
                Seu navegador não suporta o elemento de vídeo.
            </video>
        </div>
    `;
    $('#filmeDetalhes').html(detalhes);
}

function voltar() {
    window.location.href = '../../principal/HTML/principal.html';
}
