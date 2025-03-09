# Smartbit Robot Framework

Projeto feito ao longo do curso Universo Robot Framework do Fernando Papito

## Depedências

1. Faker - 33.1.0
2. psycopg2 - 2.9.10
3. robotframework - 7.1.1
4. robotframework-appiumlibrary - 2.1.0
5. robotframework-browser - 19.1.0
6. robotframework-jsonlibrary - 0.5
7. robotframework-requests - 0.9.7
8. python-dotenv - 0.21.0

## Comandos

Instalando as depedências do projeto

```
pip install -r requirements.txt
```

## Executar Teste Regressivo

Estando dentro do diretório específico (mobile ou web)

```
robot -d ./logs tests/
```
