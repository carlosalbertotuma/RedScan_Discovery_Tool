# RedScan Discovery Tool

RedScan Discovery é uma ferramenta de reconhecimento e automação de coleta de informações desenvolvida para profissionais de segurança, pesquisadores de bug bounty e analistas de OSINT.

A plataforma disponibiliza uma interface web intuitiva que permite executar diversas ferramentas de recon e discovery de forma centralizada, diretamente a partir de um container baseado em Kali Linux, facilitando a coleta, organização e análise de informações durante as fases iniciais de testes de segurança.

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

* httpx
* subfinder
* shodan 
  

Novas ferramentas podem ser adicionadas facilmente através de configuração no backend.

---

### 2️⃣ Executar container

```bash
curl -s https://raw.githubusercontent.com/carlosalbertotuma/RedScan_Discovery_Tool/main/install_redscan.sh | sudo bash

ou baixar e dar permissão execução, executar como root.

chmod +x install.sh
sudo ./install.sh

```

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



<img width="668" height="1164" alt="image" src="https://github.com/user-attachments/assets/1af9b1e0-2885-4492-b29d-3111456644a6" />



----


## ⚠️ Aviso Legal

Esta ferramenta foi criada para **uso educacional, pesquisa de segurança e testes autorizados**.

O uso contra sistemas sem autorização pode violar leis locais.

---

## 👨‍💻 Autor

Projeto RedScan Academy - Carlos Tuma - Bl4dsc4n

Ferramenta desenvolvida para automação de processos de **reconhecimento e análise de superfície de ataque**.
