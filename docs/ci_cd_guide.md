# Guia CI/CD

Este guia explica a configuração do pipeline CI/CD usando GitHub Actions para automatizar o deploy da infraestrutura e da aplicação.

## Visão Geral

O pipeline é acionado em cada push para a branch `main`. Ele automatiza as seguintes etapas:

1. **Checkout do código**: Clona o repositório para o ambiente de CI.
2. **Configuração do Terraform**: Configura o Terraform e os plugins necessários.
3. **Inicialização do Terraform**: Inicializa o Terraform no ambiente CI.
4. **Plano do Terraform**: Gera um plano de execução do Terraform.
5. **Aplicação do Terraform**: Aplica as mudanças na infraestrutura AWS.

## Configuração do Pipeline

O pipeline é definido no arquivo `.github/workflows/main.yml`. 

### Passos principais:

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  terraform:
    name: Terraform Apply
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v2

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v1
        with:
          terraform_version: 1.0.0

      - name: Terraform Init
        run: terraform init

      - name: Terraform Plan
        run: terraform plan

      - name: Terraform Apply
        if: github.ref == 'refs/heads/main'
        run: terraform apply -auto-approve
