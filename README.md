
# Repositório dedicado para Database (Terraform)
- Inclui a estrutura de banco de dados RDS para o desafio 3, com a criação de recursos na AWS
- Infraestrutura como código (IaC) com Terraform
- Utiliza Github Actions para CI/CD
- Documentação e guias de implementação
- Criação de recursos de IAM, como roles, policies, etc.

## Estrutura do Diretório

```plaintext
docs                        - documentações e guias de implementação
src                         - diretório principal com arquivos .tf
└── terraform
    ├── backend.tfvars      - configuração do backend do Terraform
    ├── external_var.tfvars - configuração dos recursos da infraestrutura
    └── *.tf                - arquivos de configuração do Terraform
```

## Configuração do CI/CD

O repositório possui um workflow de CI/CD configurado com o Github Actions, que realiza a validação e deploy do RDS na AWS.

O workflow de CI é acionado a cada push no repositório, e executa as seguintes etapas:

<ADICIONAR>

O workflow de CD é acionado manualmente, e executa as seguintes etapas:

<ADICIONAR>

## Subindo a infraestrutura com o Github Actions (Produção)

Para subir a infraestrutura com o Github Actions, siga os passos abaixo:

1. Acesse o repositório do Github e clique na aba `Actions`, ou acesse diretamente o link abaixo:
 https://github.com/pos-tech-soat08-03/easyOrder-challenge3-database/actions

2. Clique no workflow `Terraform CD - Deploy Database` e em seguida clique no botão `Run workflow`

O workflow irá solicitar as chaves de acesso da AWS, que serão obtidas do ambiente do AWS Labs, e também o nome do bucket anteriormente criado no S3, que  armazena o estado do Terraform da Infraestrutura necessária para a subida do RDS:

```plaintext
aws_access_key_id: <AWS Access Key ID>
aws_secret_access_key: <AWS Secret Access Key>
aws_session_token: <AWS Session Token>
aws_account_id: <AWS Account ID>
aws_backend_bucket: <AWS S3 Bucket para armazenamento do estado do Terraform>
aws_region: <'AWS Region>
```

Ao final da execução do workflow, o Banco de Dados será criado na AWS, e o estado do Terraform com dados da instância será armazenado no bucket S3 (mesmo utilizado na Infraestrutura).

## Subindo o Database manualmente (Desenvolvimento)

Para subir o banco de dados manualmente, siga os passos abaixo:

1. Garanta as credenciais da AWS já estejam configuradas no seu ambiente

``` bash
aws configure
```

2. Adicione o nome do bucket S3 (mesmo da Infraestrutura) no arquivo `backend.tf` ao diretório `src/terraform`:

``` hcl
bucket = "<adicione aqui o nome do bucket>"
key    = "easyorder-infra/terraform.tfstate"
region = "us-east-1"
```

3. Adicione o nome do bucket S3 (mesmo da Infraestrutura) e das credenciais de Banco desejadas no arquivo `external_var.tfvars` ao diretório `src/terraform`:

``` hcl
bucket_infra = "<adicione aqui o nome do bucket>"
key_infra    = "easyorder-infra/terraform.tfstate"
region       = "us-east-1"
db_name      = "easyorder_database_schema"
db_username  = "<adicione aqui o nome do usuario banco de dados>"
db_password  = "<adicione aqui o password do banco de dados>"
``` 

4. Execute os seguintes comandos, no diretório `src/terraform`:

``` bash
terraform init -backend-config="backend.tfvars"
``` 

``` bash
terraform plan -var-file=external_var.tfvars
``` 

``` bash
terraform apply -var-file=external_var.tfvars -auto-approve
``` 

Com essa sequência de comandos, o Banco de Dados RDS será criado, e o estado do Terraform será armazenado no bucket criado no S3, na chave `easyorder-infra/terraform.tfstate`. As informações essenciais também serão apresentadas no output do comando.

## Destruindo a infraestrutura

Para destruir a infraestrutura, execute o comando abaixo no diretório `src/terraform`:

``` bash
terraform destroy -var-file=external_var.tfvars
```

## Documentação

Para mais informações sobre a arquitetura, verifique no repositório do desafio 3 (aplicação):
https://github.com/pos-tech-soat08-03/easyOrder-challenge3-application
