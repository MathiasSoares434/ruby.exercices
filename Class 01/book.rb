require 'sqlite3'

# Classe que representa um livro
class Book
  attr_accessor :id, :title, :author, :description

  def initialize(title, author, description)
    @title = title
    @author = author
    @description = description
  end

  # Método para salvar o livro no banco de dados
  def save
    db = SQLite3::Database.new 'books.db'
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS books (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title VARCHAR(255),
        author VARCHAR(255),
        description TEXT
      );
    SQL

    db.execute "INSERT INTO books (title, author, description) VALUES (?, ?, ?)",
               [@title, @author, @description]
    @id = db.last_insert_row_id
    db.close
  end

  # Método para buscar todos os livros no banco de dados
  def self.all
    db = SQLite3::Database.new 'books.db'
    books = []
    db.execute("SELECT * FROM books") do |row|
      book = Book.new(row[1], row[2], row[3])
      book.id = row[0]
      books << book
    end
    db.close
    books
  end

  # Método para buscar um livro pelo ID no banco de dados
  def self.find(id)
    db = SQLite3::Database.new 'books.db'
    row = db.get_first_row("SELECT * FROM books WHERE id = ?", id)
    if row
      book = Book.new(row[1], row[2], row[3])
      book.id = row[0]
      db.close
      book
    else
      db.close
      nil
    end
  end

  # Método para atualizar um livro no banco de dados
  def update
    db = SQLite3::Database.new 'books.db'
    db.execute "UPDATE books SET title = ?, author = ?, description = ? WHERE id = ?",
               [@title, @author, @description, @id]
    db.close
  end

  # Método para excluir um livro do banco de dados
  def delete
    db = SQLite3::Database.new 'books.db'
    db.execute "DELETE FROM books WHERE id = ?", @id
    db.close
  end

  # Método para limpar a tabela de livros (usado para limpeza nos testes)
  def self.clear_table
    db = SQLite3::Database.new 'books.db'
    db.execute "DELETE FROM books"
    db.close
  end

  # Método para imprimir detalhes do livro
  def to_s
    "ID: #{@id}, Title: #{@title}, Author: #{@author}"
  end
end

# Exemplo de uso da classe Book

# Criando novos livros e salvando no banco de dados
book1 = Book.new("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "A young wizard's first year at Hogwarts.")
book1.save

book2 = Book.new("1984", "George Orwell", "A dystopian novel about totalitarianism.")
book2.save

# Listando todos os livros
puts "Lista de Livros:"
books = Book.all
books.each do |book|
  puts book.to_s
end
puts "\n"

# Buscando um livro pelo ID
puts "Buscando livro pelo ID:"
book = Book.find(book1.id)
puts book.to_s
puts "\n"

# Atualizando um livro
puts "Atualizando livro:"
book.title = "Harry Potter and the Sorcerer's Stone"
book.update
updated_book = Book.find(book.id)
puts updated_book.to_s
puts "\n"

# Excluindo um livro
puts "Excluindo livro:"
book.delete
books_after_deletion = Book.all
books_after_deletion.each do |book|
  puts book.to_s
end

# Limpando a tabela de livros (opcional)
# Book.clear_table
