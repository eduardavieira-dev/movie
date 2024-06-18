document.addEventListener("DOMContentLoaded", () => tabela());

function tabela(filtro = '') {
    // Garantir que filtro seja uma string
    if (typeof filtro !== 'string') {
        console.error('Filtro deve ser uma string');
        return;
    }

    $(document).ready(function () {
        $.ajax({
            type: 'POST',
            url: '../PHP/tabela.php',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            dataType: 'json',
            success: function (data) {
                data == false ? naoexibir() : exibir(data, filtro);
            }
        });
    });
}

function naoexibir() {
    let t = $('#filmes');
    t.empty();  // Limpar qualquer conteúdo existente
    let nome = $('<h3>').addClass('produto-nome').text('Nenhum filme encontrado');
    t.append(nome);
}

function exibir(data, filtro) {
    let filmes = data;
    let t = $('#filmes');
    t.empty();  // Limpar qualquer conteúdo existente

    if (filtro) {
        filmes = filmes.filter(filme => {
            return filme.nome.toLowerCase().includes(filtro.toLowerCase());
        });
    }

    filmes.forEach(function (filme) {
        let item = $('<div>').addClass('filme');

        let nome = $('<h3>').addClass('filme-nome').text(filme.nome);
        item.append(nome);

        let imgContainer = $('<div>').addClass('img-container');
        let imagem = $('<img>').attr('src', filme.imagem);
        imgContainer.append(imagem);
        item.append(imgContainer);

        let divAssitir = $('<div>').addClass('confirmacao-container');
        let botaoAssistir = $('<button>').addClass('confirmar-btn').attr('type', 'button').text('assistir').data('id', filme.id);
        divAssitir.append(botaoAssistir);
        item.append(divAssitir);

        t.append(item);
    });
}

$('#search-button').click(function () {
    let filtro = $('#search-input').val();
    tabela(filtro);
});

// Adiciona o evento de tecla pressionada ao campo de pesquisa para filtrar em tempo real
$('#search-input').on('keyup', function () {
    let filtro = $(this).val();
    tabela(filtro);
});

$(document).on('click', '.confirmar-btn', function () {
    var id = $(this).data('id');
    localStorage.setItem('id', id);
    window.location.href = '../../assistir/HTML/assistir.html';
})
