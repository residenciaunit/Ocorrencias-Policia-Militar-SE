document.addEventListener("DOMContentLoaded", function () {
    const cidadeSelect = document.getElementById("cidade");
    const bairroSelect = document.getElementById("bairro");
    const btnProximo = document.getElementById("proximo");

    const bairrosPorCidade = {
        "Aracaju": [
            "Atalaia", "Coroa do Meio", "Farolândia", "Aruana", "Jardins", "Salgado Filho", "São José", "Suíssa", "Centro", "13 de Julho", "Getúlio Vargas", "Cirurgia", "Pereira Lobo", "Dezoito do Forte", "Novo Paraíso", "Luzia", "Olaria", "Palestina", "Bugio", "Industrial", "Cidade Nova", "América", "Capucho", "Siqueira Campos", "São Conrado", "Jabotiana", "Santa Maria", "Aeroporto", "Porto Dantas", "Grageru", "Inácio Barbosa", "Marivan", "Ponto Novo", "Lamarão", "José Conrado de Araújo"
        ],
        "Itabaiana": [
            "Anízio Amancio de Oliveira", "Área Rural de Itabaiana", "Bananeiras", "Centro", "Doutor José Milton Machado", "Mamede Paes Mendonça", "Marcela", "Marianga", "Miguel Teles de Mendonça", "Oviedo Teixeira", "Porto", "Queimadas", "Riacho Doce", "Rotary Club de Itabaiana", "São Cristóvão", "Serrano"
        ],
        "Lagarto": [
            "Centro"],
        "Nossa Senhora do Socorro": [
            "Albano Franco", "Boa Viagem", "Castelo", "Centro Histórico", "Fernando Collor", "Guajará", "Itacanema", "Jardim", "João Alves", "Mangabeira", "Marcos Freire I", "Marcos Freire II", "Marcos Freire III", "Novo Horizonte", "Pai André", "Palestina de Dentro", "Palestina de Fora", "Parque dos Faróis", "Piabeta", "Porto Grande", "Santa Cecília", "Santa Inês", "Santo Inácio", "São Brás", "Sobrado", "Taboca", "Taiçoca de Dentro", "Taiçoca de Fora"
        ],
        "São Cristóvão": [
            "Centro", "Rosa Elze"],
        "Estância": [
            "Alagoas", "Centro", "Cidade Nova"],
        "Propriá": [
            "Centro"],
        "Tobias Barreto": [
            "Centro"],
        "Itaporanga D'Ajuda": [
            "Centro"]
    };

    function carregarCidadesDeSergipe() {
        cidadeSelect.innerHTML = "";
        Object.keys(bairrosPorCidade).forEach(cidade => {
            const option = document.createElement("option");
            option.value = cidade;
            option.textContent = cidade;
            cidadeSelect.appendChild(option);
        });
    }

    carregarCidadesDeSergipe();

    cidadeSelect.addEventListener("change", function () {
        bairroSelect.innerHTML = "";

        const cidadeSelecionada = cidadeSelect.value;
        const bairros = bairrosPorCidade[cidadeSelecionada] || [];

        bairros.forEach(bairro => {
            const option = document.createElement("option");
            option.value = bairro;
            option.textContent = bairro;
            bairroSelect.appendChild(option);
        });
    });

    cidadeSelect.dispatchEvent(new Event("change"));

    function validarData() {
        const dataCampo = document.getElementById("data").value;
        const hoje = new Date().toISOString().split('T')[0];
        if (dataCampo && dataCampo > hoje) {
            alert("A data não pode ser futura.");
            document.getElementById("data").value = hoje;
        }
    }

    document.getElementById("data").addEventListener("input", validarData);

    function validarHora(){
        const dataCampo = document.getElementById("data").value;
        const dataHoje = new Date().toISOString().split('T')[0];
        
        if (dataCampo === dataHoje) {
            const horaCampo = document.getElementById("hora").value;
            const agora = new Date();
            const horas = agora.getHours().toString().padStart(2, '0');
            const minutos = agora.getMinutes().toString().padStart(2, '0');
            const horaHoje = `${horas}:${minutos}`;

            if (horaCampo > horaHoje) {
                alert("Como a ocorrência foi hoje, a hora não pode ser futura.");
                document.getElementById("hora").value = horaHoje;
            }
        }
    }

    document.getElementById("hora").addEventListener("input", validarHora);
});