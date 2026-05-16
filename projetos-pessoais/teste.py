import os
import shutil
import json as json
from concurrent.futures import ThreadPoolExecutor

pasta_origem = r"C:\Users\Admin\Desktop\Package\testfolder1"
pasta_backup = r"C:\Users\Admin\Desktop\Package\testfolder2"
novo_valor = 4

# cria pasta de teste se nao existir
os.makedirs(pasta_backup, exist_ok=True)

def processar_arquivo(nome_arquivo):
    caminho_origem = os.path.join(pasta_origem, nome_arquivo)
    caminho_backup = os.path.join(pasta_backup, nome_arquivo)

    try:
        # 1. criar teste
        shutil.copy2(caminho_origem, caminho_backup)

        # 2. carregar arquivo
        with open(caminho_origem, "r", encoding="utf-8") as f:
            dados = json.load(f)

        alterado = False

        # funcao recursiva
        def editar(obj):
            nonlocal alterado

            if isinstance(obj, dict):
                for chave, valor in obj.items():
                    if chave == "passenger" and isinstance(valor, dict):
                        if "slots" in valor:
                            if valor["slots"] != novo_valor:
                                valor["slots"] = novo_valor
                                alterado = True
                    editar(valor)

            elif isinstance(obj, list):
                for item in obj:
                    editar(item)

        editar(dados)

        # 3. salvar apenas se alterado
        if alterado:
            with open(caminho_origem, "w", encoding="utf-8") as f:
                json.dump(dados, f, indent=4, ensure_ascii=False)

        return f"[OK] {nome_arquivo} (alterado={alterado})"

    except Exception as e:
        return f"[ERRO] {nome_arquivo} #para {e}"


# lista arquivos
arquivos = [f for f in os.listdir(pasta_origem) if f.endswith(".json")]

# multithread
with ThreadPoolExecutor(max_workers=16) as executor:
    resultados = list(executor.map(processar_arquivo, arquivos))

# saida
for r in resultados:
    print(r)

print(f"\nTotal: {len(arquivos)} arquivos processados")