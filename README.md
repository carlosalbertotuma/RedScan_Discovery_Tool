# RedScan Discovery Tool

RedScan Discovery Tool é uma interface web para discovery e reconnaissance em testes de segurança, projetada para facilitar a coleta de informações sobre alvos.

A ferramenta centraliza diversas técnicas utilizadas em pentest, bug bounty e OSINT, permitindo executar rapidamente:

- Reconhecimento de hosts
- Enumeração de subdomínios
- Coleta de headers HTTP
- Identificação de servidores
- Favicon hash
- Resolução DNS
- Integração com APIs OSINT
- Tudo em uma única interface.

---

## 📌 Objetivo

Centralizar ferramentas de **reconhecimento de infraestrutura e serviços expostos** em uma interface simples, permitindo:

* execução automatizada de ferramentas
* visualização de resultados em tempo real
* armazenamento de resultados em arquivos estruturados

---

## ⚙️ Tecnologias Utilizadas

* Node.js
* Express
* Docker
* Kali Linux
* HTML / JavaScript
* Integração com ferramentas OSINT e Pentest

---

## 🔎 Ferramentas Integradas

A plataforma foi projetada para integrar diversas ferramentas de reconhecimento:

* subfinder
* API shodan
* Fontes OSINT
* APIs do Subfinder integrada 
  

Novas ferramentas podem ser adicionadas facilmente através de configuração no backend.

---

### 2️⃣ Executar container

- Forma de intalar 1

```bash
curl -s https://raw.githubusercontent.com/carlosalbertotuma/RedScan_Discovery_Tool/refs/heads/main/install.sh | sudo bash

ou baixar e dar permissão execução, executar como root.

chmod +x install.sh
sudo ./install.sh

```

- Forma de intalar 2

```bash
sudo apt update && sudo apt install docker.io -y
sudo service docker start
sudo docker run --name redscan -d -it -p 3002:3000 bladscan/redscan_discovery
```

A aplicação ficará disponível em:

```
http://localhost:3002
```

---

---

## 🔐 Segurança

A ferramenta foi projetada para execução em ambientes controlados.

Boas práticas recomendadas:

* executar em container isolado
* restringir acesso à interface
* utilizar autenticação caso exposto em rede

---

## 🚀 Roadmap

Funcionalidades planejadas:

* streaming de resultados em tempo real
* dashboard de estatísticas
* integração com APIs OSINT
* sistema de plugins para novas tools
* exportação de relatórios

---

<img width="1420" height="446" alt="image" src="https://github.com/user-attachments/assets/f216c11e-0bc4-4943-9aa3-caa8d2f9fcd5" />

---

<img width="668" height="1164" alt="image" src="https://github.com/user-attachments/assets/1af9b1e0-2885-4492-b29d-3111456644a6" />



----
# Features

## Target Discovery

A ferramenta suporta **scan de múltiplos targets** simultaneamente.

É possível importar listas contendo diversos tipos de alvos.

### Importação de lista

Suporte para arquivos:

- `.txt`
- `.csv`

### Tipos de targets suportados

A ferramenta aceita diversos formatos de entrada:

- Domínios
- Endereços IP
- URLs completas
- Hosts com portas específicas

### Exemplo de entrada
```
example.com
192.168.1.10:8080
https://intranet.local
```

---

# Subdomain Enumeration

A ferramenta permite **descobrir subdomínios automaticamente**.

Existem dois métodos principais:

- Brute Force
- OSINT Enumeration

---

## Brute Force

Utiliza **wordlists para descobrir subdomínios** tentando diferentes combinações.

### Funcionamento

A ferramenta testa diversas entradas como:
```
admin.example.com
dev.example.com
api.example.com
vpn.example.com
```

### Requisito

É necessário fornecer uma **wordlist no formato `.txt`** contendo possíveis subdomínios.

Exemplo de wordlist:
```
admin
dev
api
vpn
mail
portal
intranet
```

---

# OSINT Enumeration

Enumeração baseada em **fontes públicas de inteligência (OSINT)**.

A ferramenta consulta serviços externos que coletam informações de DNS, certificados e infraestrutura.

### Serviços suportados

- subfinder
- crt.sh
- bufferover
- chaos
- shodan
- rapidns
- nubis
- certspotter

### Como ativar

Quando ativado, a ferramenta coleta subdomínios de diversas fontes públicas.

---

# Scan Options

As **opções de scan** controlam o comportamento do scanner HTTP.

### Exemplo de configuração padrão


### Explicação das flags

| Flag | Descrição |
|-----|-----|
| `-sc` | Retorna o **status code** da resposta HTTP |
| `-title` | Extrai o **título da página** |
| `-server` | Mostra o **header Server** |
| `-rt` | Mede o **tempo de resposta** |
| `-timeout` | Define o **timeout da requisição** |
| `-t` | Número de **threads concorrentes** |
| `-rl` | **Rate limit** de requisições |

---

# Probes

As **probes** permitem coletar diversas informações HTTP durante o scan.

### Opções disponíveis

| Opção | Descrição |
|-----|-----|
| `-sc` | Status code |
| `-cl` | Content length |
| `-ct` | Content type |
| `-location` | Redirect |
| `-title` | Page title |
| `-server` | Header server |
| `-rt` | Response time |
| `-method` | Método HTTP |
| `-ip` | IP resolvido |
| `-cname` | Registro CNAME |
| `-favicon` | Hash do favicon |
| `-hash` | Hash da resposta |
| `-bp` | Preview do body |

---

# Request / Performance

Configurações avançadas para controle das requisições HTTP.

| Opção | Descrição |
|-----|-----|
| `-H` | Header customizado |
| `-body` | Corpo da requisição |
| `-maxr` | Número máximo de redirects |
| `-timeout` | Timeout da requisição |
| `-x` | Excluir códigos de status |

---

# Quick Presets

A ferramenta possui **atalhos de configuração rápida** para scans comuns.

| Preset | Função |
|-----|-----|
| Web Quick | Scan HTTP rápido |
| Headers Quick | Coleta de headers |
| DNS Quick | Informações DNS |
| Favicon Quick | Hash do favicon |
| Hash Quick | Hash de conteúdo |

---

# Results

Os resultados são exibidos em **formato de tabela**.

### Campos disponíveis

| Campo | Descrição |
|-----|-----|
| URL | Host testado |
| Status | Status code |
| RT | Response time |
| Len | Content length |
| Type | Content type |
| Server | Header server |
| Title | Title da página |
| IP | IP resolvido |
| CNAME | Registro CNAME |
| Location | Redirect |
| Favicon | Hash do favicon |
| Hash | Hash do conteúdo |
| Error | Erros encontrados |

---

# Export

Os resultados podem ser exportados em diferentes formatos.

### Formatos suportados

- JSON
- CSV

Isso permite integração com:

- ferramentas de análise
- scripts
- pipelines de segurança

---

# Shodan Module

A ferramenta possui **integração direta com a API do Shodan**.

Isso permite realizar consultas avançadas de infraestrutura.

### Tipos de consulta

| Query | Descrição |
|-----|-----|
| `host` | Informações detalhadas de um host |
| `dns-domain` | DNS relacionado a um domínio |
| `dns-resolve` | Resolver domínio para IP |
| `dns-reverse` | Reverse DNS |
| `search` | Busca geral no Shodan |
| `dorks` | Dorks do Shodan |

---

# API Keys

A ferramenta suporta **integração com diversas APIs OSINT**.

As chaves podem ser configuradas na seção:

API Keys


### Serviços suportados

| Serviço |
|-----|
| Chaos |
| Shodan |
| VirusTotal |
| SecurityTrails |
| Censys |
| FOFA |
| GitHub |

Após inserir as chaves, clique em:


-----
## ⚠️ Aviso Legal

Esta ferramenta deve ser utilizada **apenas em ambientes autorizados**.

O uso sem permissão pode violar:

- leis locais
- políticas de segurança
- termos de serviço de plataformas

O autor **não se responsabiliza por qualquer uso indevido da ferramenta**.

Utilize apenas para:

- **pesquisa de segurança**
- **pentests autorizados**
- **programas de bug bounty**

---

## 👨‍💻 Autor

Projeto RedScan Academy - Carlos Tuma - Bl4dsc4n

Ferramenta desenvolvida para automação de processos de **reconhecimento e análise de superfície de ataque**.
