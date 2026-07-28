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

### Workflow 1: Onboarding Inicial (Executado apenas 1x)
1. Executar `node doctor.mjs --json` para identificar pendências.
2. Criar `cv.md` a partir das informações reais do usuário (sem inventar fatos).
3. Criar `config/profile.yml` definindo cargos-alvo e `language.output: pt-BR`.
4. Criar `portals.yml` a partir de `templates/portals.example.yml`.
5. Rodar `npm run sync-check` e `npm run verify`.

### Workflow 2: Rotina Diária de Busca (Daily Search Loop)
1. **Scanner:** `npm run scan -- --verify` (Descobre vagas e preenche `data/pipeline.md`).
2. **Processamento:** `/career-ops pipeline` (Avalia vagas na fila e gera relatórios em `reports/`).
3. **Revisão:** Apresenta ao usuário apenas as vagas com nota ≥ 3.5/5.0.
4. **Decisão:** Pergunta ao usuário quais vagas ele deseja avançar.

### Workflow 3: Avaliação & Candidatura Cirúrgica (Single Job)
1. **Avaliação:** `/career-ops {URL}` (Executa o auto-pipeline completo).
2. **Relatório:** Exibe nota de fit, riscos, senioridade e legitimidade (Blocos A-G).
3. **PDF:** Se nota ≥ 3.0, gera currículo otimizado em `output/`.
4. **Formulário:** Se o usuário decidir aplicar, executa `/career-ops apply` para gerar respostas para os campos.
5. **Human-in-the-Loop:** O usuário faz a submissão final no site da empresa.

### Workflow 4: Preparação para Entrevistas
1. **Histórias STAR:** Atualiza `interview-prep/story-bank.md`.
2. **Simulação:** Executa `/career-ops interview/practice` para rodar perguntas simuladas.
3. **Red Flags:** Executa `/career-ops interview-redflag` para analisar a saúde da empresa.

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
