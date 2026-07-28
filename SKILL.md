---
name: career-ops-navigator
description: >-
  Navegador e assistente de workflow inteligente para o career-ops. Guia o usuário
  passo a passo em qualquer CLI de IA (Antigravity, Codex, OpenCode, Claude Code, Copilot)
  traduzindo intenções em linguagem natural nos comandos, ordens e scripts corretos
  sem necessidade de memorização.
arguments: intent
user_invocable: true
user-invocable: true
argument-hint: "[ajuda | como usar | ordem de comandos | fluxo diario | avaliar vaga | scan | pdf | entrevista | status]"
license: MIT
---

# career-ops-navigator -- Assistente Interativo de Workflow

O **career-ops-navigator** elimina a necessidade de memorizar scripts do Node.js, subcomandos do agente ou a ordem correta de execução do projeto `career-ops`.

Ele traduz o objetivo atual do usuário (em linguagem natural) nas ações, ordens de execução e verificações adequadas para qualquer CLI de IA.

---

## 1. Adaptador Multi-CLI (Como invocar em cada CLI)

| CLI | Forma de Invocação | Exemplo de Uso |
|---|---|---|
| **Antigravity CLI** | Slash command ou prompt | `/career-ops` ou `"como usar o career-ops para achar vagas?"` |
| **Claude Code** | Slash command ou prompt | `/career-ops` ou `"qual a ordem para aplicar em uma vaga?"` |
| **Codex** | Prompt na raiz do projeto | `codex` -> `"Execute o fluxo completo de busca de vagas com career-ops"` |
| **OpenCode / Agentic CLIs** | Prompt ou skill router | `"Quero me preparar para a entrevista da empresa X usando career-ops"` |
| **GitHub Copilot CLI** | Slash command de skill | `@career-ops-navigator o que devo fazer agora?` |

---

## 2. Matriz de Intenções (O que você quer fazer?)

Identifique a intenção do usuário e execute a sequência recomendada:

| Intenção do Usuário | O que o agente deve fazer | Comando/Script Utilizado |
|---|---|---|
| **Primeira vez / Configurar** | Diagnosticar ambiente, criar `cv.md`, `profile.yml` e `portals.yml` | `npm run doctor` → Onboarding conversacional |
| **Buscar novas vagas** | Validar portais configurados e escanear vagas ativas | `npm run validate:portals` → `npm run scan -- --verify` |
| **Processar vagas encontradas** | Avaliar e gerar relatórios para o lote da pipeline | `/career-ops pipeline` |
| **Avaliar 1 vaga específica** | Extrair JD, verificar atividade, pontuar (1-5) e salvar relatório | `/career-ops {URL_OU_TEXTO_DA_VAGA}` |
| **Gerar Currículo ATS em PDF** | Gerar PDF personalizado na pasta `output/` | `/career-ops pdf` ou `npm run pdf -- input.html output.pdf` |
| **Auxiliar na Candidatura** | Mapear formulário, gerar respostas sem submeter | `/career-ops apply` |
| **Preparar para Entrevista** | Gerar guia de perguntas, histórias STAR e cultura | `/career-ops interview-prep` ou `/career-ops interview` |
| **Ver Status & Dashboard** | Resumir pipeline, métricas de funil ou abrir TUI | `npm run tracker` ou `/career-ops tracker` |
| **Manutenção & Diagnóstico** | Validar dados, checar duplicatas e sincronia | `npm run sync-check` → `npm run verify` |

---

## 3. Sequenciamentos de Workflow Recomendados

### Workflow Autônomo Completo por Vaga (Ciclo de Candidatura & Evidências)
Para cada vaga relevante identificada na pipeline, o agente deve executar o ciclo completo sem demandar confirmações repetitivas:
1. **Avaliação & Report:** Analisar a vaga e gerar o relatório em `reports/NNN-{company-slug}-{date}.md`.
2. **PDF ATS:** Gerar o currículo otimizado em HTML e compilar o PDF A4 na pasta `output/NNN-{company-slug}.pdf`.
3. **Pacote de Apply:** Gerar as respostas para o formulário de candidatura (Why company, experiência técnica, pretensão, autorização de trabalho) e salvar a seção `## Application Answers` no relatório.
4. **Outreach & Recrutadores:** Pesquisar contatos no LinkedIn (Recrutadores, Engineering Managers, Founders), gerar links de busca direta e salvar o guia em `interview-prep/{company-slug}-recruiter-outreach.md`.
5. **Tracker:** Registrar a vaga no tracker `data/applications.md` (status `Evaluated`, PDF `✅`) e validar com `npm run verify`.
6. **Auto-Progressão:** Avançar automaticamente para a próxima vaga da fila sem solicitar comandos intermediários repetitivos.

---

## 4. Regras Absolutas e Salvaguardas

1. **Zero Fabricação (Fonte Única da Verdade):** Apenas utilize fatos documentados em `cv.md`, `config/profile.yml` ou afirmados diretamente pelo usuário. Nunca invente métricas, tecnologias ou empregos.
2. **Supervisão Humana Obrigatória:** Nunca clique em "Submit", envie e-mails ou envie mensagens de recrutamento sem aprovação prévia do usuário.
3. **Diferenciação Agente vs Script:**
   - Scripts `npm run ...` realizam processamentos locais rápidos e determinísticos.
   - Modos `/career-ops ...` utilizam a inteligência do agente de IA para análise, redação e síntese.
4. **Idioma de Saída:** Todo o conteúdo gerado para leitura humana (relatórios, currículos, e-mails, respostas) deve estar no idioma configurado em `profile.yml` (padrão: `pt-BR`).

---

## 5. Árvore de Solução de Problemas

- **Erro `Cannot find package ...`:** Execute `npm install`.
- **Nenhuma vaga retornada no Scan:** Execute `npm run validate:portals` para verificar sintaxe do `portals.yml`.
- **PDF não é gerado:** Instale dependências do navegador com `npx playwright install chromium`.
- **Incoerência no Tracker:** Execute `npm run normalize` e em seguida `npm run verify`.
