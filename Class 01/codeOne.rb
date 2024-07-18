class Pessoa

  def initialize(nome, idade, altura, cores, info_adicionais)
    @nome = nome
    @idade = idade
    @altura = altura
    @cores = cores
    @info_adicionais = info_adicionais
  end
  
  def nome
    @nome
  end
 
  def idade
    @idade
  end
  
  def altura
    @altura
  end
  
  def cores
    @cores
  end
  
  def info_adicionais
    @info_adicionais
  end

  def nome=(novo_nome)
    @nome = novo_nome
  end

  def idade=(nova_idade)
    @idade = nova_idade
  end

  def altura=(nova_altura)
    @altura = nova_altura
  end
  def cores=(novas_cores)
    @cores = novas_cores
  end

  def info_adicionais=(novas_infos)
    @info_adicionais = novas_infos
  end

  def exibir_informacoes
    puts "Nome: #{@nome}"
    puts "Idade: #{@idade}"
    puts "Altura: #{@altura}"
    puts "Cores favoritas: #{@cores.join(', ')}"
    puts "Informações adicionais:"
    @info_adicionais.each do |chave, valor|
      puts "#{chave.capitalize}: #{valor}"
    end
  end
end

pessoa = Pessoa.new(
  "João",            # Nome
  30,                # Idade
  1.75,              # Altura
  ["vermelho", "verde", "azul"], # Cores favoritas
  { "profissão" => "Desenvolvedor", "cidade" => "São Paulo" } # Informações adicionais
)

pessoa.exibir_informacoes

pessoa.nome = "Maria"
pessoa.idade = 28
pessoa.altura = 1.65
pessoa.cores = ["azul", "verde"]
pessoa.info_adicionais = {"profissão" => "Designer","cidade" => "Rio de Janeiro"}

puts"\nInformações atualizadas:"
pessoa.exibir_informacoes