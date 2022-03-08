# Docker

## Definição
Docker é um conjunto de produtos de plataforma como serviço que usam virtualização de nível de sistema operacional para entregar software em pacotes chamados contêineres. Os contêineres são isolados uns dos outros e agrupam seus próprios softwares, bibliotecas e arquivos de configuração.

## Comparção com máquina virtual
O Docker é uma tecnologia baseada em contêiner e os contêineres são apenas o espaço do usuário do sistema operacional. No nível inferior, um contêiner é apenas um conjunto de processos isolados do resto do sistema, executados a partir de uma imagem distinta que fornece todos os arquivos necessários para dar suporte aos processos. Ele é construído para executar aplicativos. No Docker, os contêineres em execução compartilham o kernel do sistema operacional.

Uma Máquina Virtual, por outro lado, não é baseada em tecnologia de contêiner. Eles são compostos de espaço do usuário mais espaço do kernel de um sistema operacional. Em VMs, o hardware do servidor é virtualizado. Cada VM tem sistema operacional (SO) e aplicativos. Ele compartilha recursos de hardware do host.

VMs e Docker – cada um vem com benefícios e deméritos. Em um ambiente de VM, cada carga de trabalho precisa de um sistema operacional completo. Mas com um ambiente de contêiner, várias cargas de trabalho podem ser executadas com 1 SO. Quanto maior a pegada do SO, mais benefícios ambientais dos contêineres. Com isso, traz mais benefícios, como recursos de gerenciamento de TI reduzidos, tamanho reduzido de snapshots, aplicativos mais rápidos, atualizações de segurança reduzidas e simplificadas, menos código para transferir, migrar e carregar cargas de trabalho.

## O que pode ser dockerizado
De modo geral, as aplicações desenvolvidas podem ser dockerizadas

## Fontes
- [Docker](https://pt.wikipedia.org/wiki/Docker_(software))
- [Docker vs. VM – who wins?](https://devopscon.io/blog/docker/docker-vs-virtual-machine-where-are-the-differences/#:~:text=In%20Docker%2C%20the%20containers%20running,VMs%2C%20server%20hardware%20is%20virtualized.)