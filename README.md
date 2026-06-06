# FinancePro

Aplicação de gestão financeira pessoal com autenticação, parcelas de cartão, financiamento de veículo e IA consultora.

## Stack
- **Frontend:** React + Vite
- **Backend/Auth:** Supabase (PostgreSQL + Auth + RLS)
- **IA:** Claude API (Anthropic)
- **Deploy:** Vercel

## Setup rápido

### 1. Supabase
1. Crie um projeto em [supabase.com](https://supabase.com)
2. Execute o arquivo `setup.sql` no SQL Editor
3. Em Authentication > Providers > Email, desative "Confirm email" para testes
4. Copie URL e anon key de Settings > API

### 2. Variáveis de ambiente
```bash
cp .env.example .env
```
Edite o arquivo `.env` com suas credenciais.

### 3. Rodar localmente
```bash
npm install
npm run dev
```
Acesse http://localhost:5173

### 4. Deploy no Vercel
1. Suba o projeto para o GitHub
2. Importe em [vercel.com/new](https://vercel.com/new)
3. Adicione as variáveis de ambiente (VITE_SUPABASE_URL e VITE_SUPABASE_ANON_KEY)
4. Clique Deploy

## Funcionalidades
- Autenticação por e-mail (cadastro, login, recuperação de senha)
- Cadastro de receitas fixas (CLT) e variáveis
- Despesas com categorias: Aluguel, Financiamento, Insumos, Doação, Empréstimo...
- Controle de parcelas por cartão de crédito
- Metas financeiras com aportes
- Dashboard com KPIs e indicadores
- Consultora IA integrada (Claude)
- Edição, duplicação e exclusão de lançamentos
- Row Level Security (dados isolados por usuário)
