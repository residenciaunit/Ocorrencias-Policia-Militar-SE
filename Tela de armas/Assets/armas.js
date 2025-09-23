document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("form-arma");
    const salvarBtn = document.getElementById("salvar-arma");

    salvarBtn.addEventListener("click", (event) => {
        event.preventDefault();  

        const tipoArma = document.getElementById("tipo-arma").value;
        const marcaArma = document.getElementById("marca-arma").value;
        const modeloArma = document.getElementById("modelo-arma").value;
        const numeroSerie = document.getElementById("numero-serie").value;
        const quantidadeMunições = document.getElementById("quantidade-municoes").value;
        const calibre = document.getElementById("calibre").value;
        const observacoes = document.getElementById("observacoes-arma").value;

        const tipoArmaId = obterTipoArmaId(tipoArma);  
        const calibreId = obterCalibreId(calibre);  

    
        const ropId = 123;  

        const dadosArma = {
            calibreId,
            id: 0,  
            numeroSerie,
            quantidadeMunicoes: parseInt(quantidadeMunições, 10),
            ropId,
            tipoArmaId
        };

        const API_BASE_URL = "https://hml.api.portal.pm.se.gov.br"; 

        fetch(`${API_BASE_URL}/msocorrencia/rop/arma-fogo-apreendida`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${localStorage.getItem("token")}` 
            },
            body: JSON.stringify(dadosArma)
        })
        .then((response) => {
            if (!response.ok) {
                throw new Error(`Erro: ${response.statusText}`);
            }
            return response.json();
        })
        .then((data) => {
            console.log("Arma cadastrada com sucesso:", data);
            alert("Arma cadastrada com sucesso!");
            form.reset();  
        })
        .catch((error) => {
            console.error("Erro ao cadastrar a arma:", error);
            alert("Erro ao cadastrar a arma. Tente novamente.");
        });
    });
});

function obterTipoArmaId(tipo) {
    switch (tipo) {
        case "pistola":
            return 1;  
        case "revolver":
            return 2;  
        case "espingarda":
            return 3;  
        case "rifle":
            return 4;  
        default:
            return 0;  
    }
}

function obterCalibreId(calibre) {
    switch (calibre) {
        case ".380":
            return 1;  
        case "9mm":
            return 2;  
        default:
            return 0;  
    }
}
