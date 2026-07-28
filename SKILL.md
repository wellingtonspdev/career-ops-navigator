---
name: career-ops-navigator
version: 2.0.0
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

# career-ops-navigator v2.0.0 -- Assistente Interativo de Workflow

O **career-ops-navigator** elimina a necessidade de memorizar scripts do Node.js, subcomandos do agente ou a ordem correta de execução do projeto `career-ops`.

Ele traduz o objetivo atual do usuário (em linguagem natural) nas ações, ordens de execução e verificações adequadas para qualquer CLI de IA.

---

## 📌 Histórico de Versões & Controle de Release

| Versão | Data | Principais Mudanças |
|---|---|---|
| **v2.0.0** | 2026-07-28 | **Major Release:** Ciclo autônomo completo por vaga (Reports + PDFs A4 + Apply JSON + Recrutadores LinkedIn + Tracker), otimizações operacionais e 6 novos aprendizados de precisão. |
| **v1.1.0** | 2026-07-28 | Adicionadas diretrizes de execução contínua sem prompts repetitivos por etapa e sincronização multi-CLI. |
| **v1.0.0** | 2026-07-28 | Lançamento inicial da skill com matriz de intenções, comandos e scripts para Antigravity CLI, Codex, Claude Code, OpenCode e Copilot. |

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
1. **Reserva de Número:** Executar `node reserve-report-num.mjs` para obter o número `NNN` sem conflitos.
2. **Avaliação & Report:** Analisar a vaga e gerar o relatório em `reports/NNN-{company-slug}-{date}.md`.
3. **PDF ATS:** Gerar o currículo otimizado em HTML (margem `0.6in`, fonte `11px`) e compilar o PDF A4 na pasta `output/NNN-{company-slug}.pdf` com `generate-pdf.mjs`.
4. **Pacote de Apply:** Criar o JSON de respostas em `scratch/` e persistir na seção `## Application Answers` do relatório usando `node application-answers.mjs`.
5. **Outreach & Recrutadores:** Pesquisar contatos no LinkedIn (Recrutadores, Engineering Managers, Founders), gerar links de busca direta clicáveis e salvar o guia em `interview-prep/{company-slug}-recruiter-outreach.md`.
6. **Tracker:** Registrar a vaga no tracker `data/applications.md` (status `Evaluated`, PDF `✅`), atualizar `data/pipeline.md` e validar com `npm run verify`.
7. **Auto-Progressão:** Avançar automaticamente para a próxima vaga da fila sem solicitar comandos intermediários repetitivos.

---

## 4. Aprendizados Acumulados & Evolução da Skill (Práticas Comprovadas)

Com base na execução de dezenas de ciclos de candidatura reais, este conhecimento operacional garante 100% de precisão e velocidade:

### A. Numeração e Reserva de Relatórios (`reserve-report-num.mjs`)
- **Prática:** Sempre consulte o script de reserva para determinar a numeração oficial `NNN` (ex: `001`, `002`, `020`), evitando numeração manual incorreta ou colisão.
- **Liberação:** Sempre execute `node reserve-report-num.mjs --release NNN` ao finalizar a gravação do relatório.

### B. Persistência de Respostas (`application-answers.mjs`)
- **Prática:** Em vez de editar a seção `## Application Answers` com regex, crie um JSON estruturado em `scratch/{company}-answers.json` com os campos `freeText`, `fieldValues`, `files` e execute:
  `node application-answers.mjs --report reports/NNN-*.md --input scratch/*.json --state filled`

### C. Otimização de PDFs ATS em 1 Página A4
- **Prática:** Para garantir que o currículo caiba perfeitamente em 1 página A4 sem truncamento:
  - Utilize margem CSS `@page { margin: 0.6in; }` e tamanho de fonte `11px`.
  - Compile com `node generate-pdf.mjs input.html output.pdf --format=a4`.

### D. Estruturação de Guias de Recrutadores (`interview-prep/`)
- **Prática:** Cada guia de abordagem de recrutadores deve conter:
  1. Links clicáveis de pesquisa no LinkedIn (`https://www.linkedin.com/search/results/people/?keywords=...`).
  2. Rascunhos de notas de conexão em Português e Inglês estritamente limitados a ≤300 caracteres.
  3. Template de InMail/E-mail completo.

### E. Integridade e Validação Contínua (`npm run verify`)
- **Prática:** O script `npm run verify` verifica 12 regras estritas de consistência (links, formatação, status canônicos, duplicatas). Execute após cada lote para manter 0 erros.

### F. Modo Autônomo & Permissões
- **Prática:** Inicie o CLI com `--auto-approve` (`agy --auto-approve`) ou aprove o prefixo de comandos (`npm`, `node`, `git`) para evitar interrupções manuais por comando.

---

## 5. Regras Absolutas e Salvaguardas

1. **Zero Fabricação (Fonte Única da Verdade):** Apenas utilize fatos documentados em `cv.md`, `config/profile.yml` ou afirmados diretamente pelo usuário. Nunca invente métricas, tecnologias ou empregos.
2. **Supervisão Humana Obrigatória:** Nunca clique em "Submit", envie e-mails ou envie mensagens de recrutamento sem aprovação prévia do usuário.
3. **Diferenciação Agente vs Script:**
   - Scripts `npm run ...` realizam processamentos locais rápidos e determinísticos.
   - Modos `/career-ops ...` utilizam a inteligência do agente de IA para análise, redação e síntese.
4. **Idioma de Saída:** Todo o conteúdo gerado para leitura humana (relatórios, currículos, e-mails, respostas) deve estar no idioma configurado em `profile.yml` (padrão: `pt-BR`).

---

## 6. Árvore de Solução de Problemas

- **Erro `Cannot find package ...`:** Execute `npm install`.
- **Nenhuma vaga retornada no Scan:** Execute `npm run validate:portals` para verificar sintaxe do `portals.yml`.
- **PDF não é gerado:** Instale dependências do navegador com `npx playwright install chromium`.
- **Incoerência no Tracker:** Execute `npm run normalize` e em seguida `npm run verify`.
