# Projeto AZ-900 IaC com Bicep

Este projeto demonstra como provisionar e monitorar uma **Máquina Virtual no Azure** utilizando **Infrastructure as Code (IaC)** com **Bicep**.  
Os templates estão organizados em três arquivos principais:

- `vm.bicep` → Criação da máquina virtual
- `network.bicep` → Configuração de rede (VNet, Subnet, NSG, IP público)
- `monitoring.bicep` → Alertas de monitoramento (CPU, eventos administrativos da VM)

---

## 📂 Estrutura do Projeto

az900-iac-bicep/
├── templates/
│   ├── network.bicep
│   ├── vm.bicep
│   └── monitoring.bicep
├── README.md

---

## 🚀 Pré-requisitos

- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) instalado
- Extensão Bicep instalada e atualizada:
  ```bash
  az bicep upgrade
- Uma Resource Group já criado:
  ```bash
  az group create --name RG-az900-iac-bicep --location eastus

📦 Estrutura dos Templates

1. Cria os recursos de rede necessários:

• 	Virtual Network (VNet)
• 	Subnet
• 	Network Security Group (NSG) com regras básicas
• 	IP público
• 	Network Interface (NIC)

2. Cria a máquina virtual:

• 	Nome: 
• 	Sistema operacional: Ubuntu (padrão)
• 	Usuário administrador: 
• 	Senha definida via parâmetro seguro
• 	Associação com NIC e IP público

3. Configura alertas de monitoramento:

• 	Metric Alert: uso de CPU acima de 80% (opcional, requer )
• 	Activity Log Alert: eventos administrativos da VM (start, stop, restart, delete)

⚙️ Deploy

Máquina Virtual
```bash
az deployment group create \
  --resource-group RG-az900-iac-bicep \
  --template-file ./templates/vm.bicep
```

Rede
```bash
az deployment group create \
  --resource-group RG-az900-iac-bicep \
  --template-file ./templates/network.bicep
```

Monitoramento
```bash
az deployment group create \
  --resource-group RG-az900-iac-bicep \
  --template-file ./templates/monitoring.bicep
```

📊 Monitoramento
• 	CPU Alert: dispara quando a utilização média de CPU > 80% em 5 minutos.
• 	Activity Log Alert: dispara quando a VM é iniciada, desligada, reiniciada ou excluída.

📚 Referências
• 	Documentação do Bicep (learn.microsoft.com in Bing)
• 	Azure Monitor Alerts (learn.microsoft.com in Bing)
• 	Activity Log Alerts (learn.microsoft.com in Bing)