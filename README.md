# 🧭 career-ops-navigator v2.0.0

<div align="center">

[![Version 2.0.0](https://img.shields.io/badge/version-2.0.0-blue.svg)](SKILL.md)
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Base Tool](https://img.shields.io/badge/Base--Tool-career--ops-blue.svg)](https://github.com/santifer/career-ops.git)
[![Multi-CLI Support](https://img.shields.io/badge/CLIs-Claude%20%7C%20Antigravity%20%7C%20Codex%20%7C%20OpenCode%20%7C%20Copilot-orange.svg)](#-compatibilidade-multi-cli)

**Navegador e Assistente Interativo de Workflow para o [career-ops](https://github.com/santifer/career-ops.git)**

*Elimine a necessidade de memorizar dezenas de scripts `npm`, subcomandos e a ordem correta do seu funil de candidatura.*

</div>

---

## 📌 Histórico de Versões & Controle de Release

| Versão | Data | Tipo | Descrição das Mudanças |
|---|---|---|---|
| **v2.0.0** | 2026-07-28 | **Major Release** | **Ciclo Autônomo Completo por Vaga:** Reserva de relatórios (`reserve-report-num.mjs`), compilação de PDFs ATS A4 (1 página), persistência determinística de formulários (`application-answers.mjs`), busca de recrutadores no LinkedIn com links clicáveis e 6 novos aprendizados de precisão. |
| **v1.1.0** | 2026-07-28 | Minor Update | Suporte ao modo autônomo sem prompts repetitivos por etapa e sincronização contínua. |
| **v1.0.0** | 2026-07-28 | Initial Release | Lançamento inicial com matriz de intenções multi-CLI. |

---

## 💡 O que é o `career-ops-navigator`?

O **`career-ops-navigator`** é uma skill universal de IA que funciona como um **piloto automático instrucional** para a ferramenta [career-ops](https://github.com/santifer/career-ops.git).

Ela traduz qualquer desejo em linguagem natural do usuário (ex: *"quero achar vagas de IA"*, *"como me preparo para a entrevista?"*, *"qual comando rodar agora?"*) diretamente nos **comandos, scripts e ordens operacionais corretas** para o seu CLI de IA preferido.

---

## 🔗 Ferramenta Base

Esta skill é um complemento para a ferramenta principal **career-ops**:

- 📌 **Repositório do career-ops:** [https://github.com/santifer/career-ops.git](https://github.com/santifer/career-ops.git)
- 📌 **Repositório desta Skill:** [https://github.com/wellingtonspdev/career-ops-navigator.git](https://github.com/wellingtonspdev/career-ops-navigator.git)

---

## ⚡ Instalação Rápida (Global)

Você pode instalar a skill globalmente no seu sistema com apenas um comando:

### Windows (PowerShell):
```powershell
irm https://raw.githubusercontent.com/wellingtonspdev/career-ops-navigator/main/install.ps1 | iex
```

### Linux / macOS (Bash):
```bash
curl -fsSL https://raw.githubusercontent.com/wellingtonspdev/career-ops-navigator/main/install.sh | bash
```

---

## 💻 Compatibilidade Multi-CLI (Passo a Passo)

A skill já vem pré-configurada para todos os CLIs de IA modernos:

### 1. Antigravity CLI (`agy`)
- **Comando:** `/career-ops` ou `"Como usar o career-ops para achar novas vagas?"`

### 2. Claude Code (`claude`)
- **Comando:** `/career-ops` ou `"Qual a ordem correta para me candidatar a uma vaga no career-ops?"`

### 3. OpenAI Codex CLI (`codex`)
- **Comando:** `"Execute o workflow de busca de vagas com a skill career-ops-navigator"`

### 4. OpenCode & Outros CLIs Agentic
- **Comando:** `"Quero me preparar para a entrevista da empresa X usando a skill career-ops-navigator"`

### 5. GitHub Copilot CLI
- **Comando:** `@career-ops-navigator o que devo fazer agora no meu funil?`

---

## 🗺️ Matriz de Intenções

| O que você quer fazer? | A Skill fará automaticamente: |
|---|---|
| 🏁 **Configurar / Onboarding** | Diagnosticar o repositório (`npm run doctor`), orientar criação do `cv.md` e `profile.yml`. |
| 🔍 **Buscar Vagas (Scan)** | Validar portais (`npm run validate:portals`) e executar o scanner (`npm run scan -- --verify`). |
| ⚡ **Avaliar Lote de Vagas** | Executar o processador de pipeline (`/career-ops pipeline`). |
| 🎯 **Avaliar 1 Vaga Específica** | Extrair JD, pontuar (1-5) e salvar relatório em `reports/`. |
| 📄 **Gerar Currículo ATS (PDF)** | Gerar PDF estilizado e otimizado na pasta `output/` (`/career-ops pdf`). |
| 📝 **Assistente de Formulação (Apply)** | Mapear formulário e rascunhar respostas personalizadas sem submeter sem sua aprovação. |
| 🎤 **Preparar para Entrevista** | Montar treino de histórias STAR e preparar perguntas (`/career-ops interview-prep`). |
| 📊 **Ver Métricas do Tracker** | Exibir saúde e status da pipeline (`npm run verify` ou `/career-ops tracker`). |

---

## 🛡️ Regras e Salvaguardas Éticas

- 🛑 **Sem Envio Automático:** A skill **NUNCA** envia candidaturas ou e-mails sem sua confirmação explícita.
- 📌 **Veracidade Garantida:** Fatos profissionais são extraídos **apenas** do seu `cv.md` e `profile.yml`. Nada é inventado.
- 🔒 **Privacidade Local:** Todas as análises rodam localmente no seu ambiente.

---

## 📄 Licença

Distribuído sob a licença MIT. Veja `LICENSE` para mais informações.
