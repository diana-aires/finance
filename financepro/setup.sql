-- FinancePro: Script de criação do banco de dados
-- Execute no SQL Editor do Supabase (supabase.com/dashboard)

-- Tabela de lançamentos
CREATE TABLE IF NOT EXISTS lancamentos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users NOT NULL,
  tipo TEXT NOT NULL,
  cat TEXT NOT NULL,
  descricao TEXT,
  valor NUMERIC NOT NULL,
  data DATE NOT NULL,
  parcelas INTEGER,
  parcela_atual INTEGER,
  cartao TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Tabela de metas
CREATE TABLE IF NOT EXISTS metas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users NOT NULL,
  nome TEXT NOT NULL,
  valor NUMERIC NOT NULL,
  atual NUMERIC DEFAULT 0,
  prazo TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Row Level Security (cada usuário vê apenas seus dados)
ALTER TABLE lancamentos ENABLE ROW LEVEL SECURITY;
ALTER TABLE metas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "lancamentos_own" ON lancamentos
  FOR ALL USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "metas_own" ON metas
  FOR ALL USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_lancamentos_user ON lancamentos(user_id);
CREATE INDEX IF NOT EXISTS idx_lancamentos_data ON lancamentos(data DESC);
CREATE INDEX IF NOT EXISTS idx_metas_user ON metas(user_id);
