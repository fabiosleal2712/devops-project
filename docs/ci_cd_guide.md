# Guia de Configuração de CI/CD com GitHub Actions

## Introdução
Este documento descreve a configuração do pipeline de CI/CD utilizando GitHub Actions para automação de build, teste e deploy da infraestrutura AWS com Terraform.

## Configuração do Pipeline

### 1. Arquivo de Workflow
- O pipeline de CI/CD é definido no arquivo `.github/workflows/main.yml`.

### 2. Disparo do Pipeline
- O pipeline é disparado automaticamente em qualquer push no branch `main`.

## Passos do Pipeline

### 1. Checkout do Código
- A primeira etapa do pipeline realiza o checkout do código do repositório.

### 2. Setup do Terraform
- O Terraform é configurado na versão especificada, garantindo a consistência do ambiente de execução.

### 3. Inicialização do Terraform
- O comando `terraform init` é executado para inicializar o backend e preparar o ambiente.

### 4. Aplicação das Configurações
- O comando `terraform apply -auto-approve` é utilizado para aplicar as configurações no ambiente AWS.

## Monitoramento e Logs

### 1. Logs do Pipeline
- Os logs do pipeline podem ser visualizados diretamente na interface do GitHub Actions.

### 2. Troubleshooting
- Em caso de falha no pipeline, os logs detalhados fornecerão insights para identificar e resolver o problema.

---

**Este guia proporciona uma visão clara de como configurar e utilizar o pipeline de CI/CD para este projeto.** 🚀
