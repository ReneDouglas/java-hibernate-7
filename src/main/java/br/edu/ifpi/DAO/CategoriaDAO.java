package br.edu.ifpi.DAO;


import br.edu.ifpi.DAO.queries.Queries;
import br.edu.ifpi.config.MySQLConnection;
import br.edu.ifpi.entities.Categoria;
import java.sql.*;
import java.util.*;

public class CategoriaDAO implements GenericDAO<Categoria, Integer>{


    @Override
    public void salvar(Categoria categoria) throws SQLException {

        try (Connection conn = MySQLConnection.getConnection()) {

            Properties properties = new Properties();

            String sql = Queries.INSERT_CATEGORIA;
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, categoria.getNome());
            stmt.setString(2, categoria.getDescricao());
            stmt.execute();

            System.out.println("Salvo com sucesso!");

        }

    }

    @Override
    public void excluir(Categoria categoria) throws SQLException {

        try (Connection conn = MySQLConnection.getConnection()) {

            categoria = buscarPorId(categoria.getId());

            if(categoria.getId() == null){
                System.out.println("Categoria não encontrada.");
                return;
            }

            String sql = """
            DELETE FROM categorias WHERE id = ?
            """;
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, categoria.getId());
            stmt.execute();
            System.out.println("Excluido com sucesso!");
        }

    }

    @Override
    public void alterar(Categoria categoria) throws SQLException {

        categoria = buscarPorId(categoria.getId());

        if(categoria.getId() == null){
            System.out.println("Categoria não encontrada.");
            return;
        }
        String sql = "UPDATE categorias SET nome = ?, descricao = ? WHERE id = ?";
        try (Connection conn = MySQLConnection.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, categoria.getNome());
            stmt.setString(2, categoria.getDescricao());
            stmt.setInt(3, categoria.getId());
            stmt.execute();
            System.out.println("Alterado com sucesso!");
        }

    }

    @Override
    public List<Categoria> listar() throws SQLException {

        try (Connection conn = MySQLConnection.getConnection()) {
            String sql = "SELECT * FROM categorias";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            List<Categoria> categorias = new ArrayList<>();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("id"));
                categoria.setNome(rs.getString("nome"));
                categoria.setDescricao(rs.getString("descricao"));
                categorias.add(categoria);
            }
            return categorias;
        }
    }

    @Override
    public Categoria buscarPorId(Integer id) throws SQLException {

        try (Connection conn = MySQLConnection.getConnection()) {
            String sql = "SELECT * FROM categorias WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            Categoria categoria = null;
            while (rs.next()) {
                categoria = new Categoria();
                categoria.setId(rs.getInt("id"));
                categoria.setNome(rs.getString("nome"));
                categoria.setDescricao(rs.getString("descricao"));
            }
            return categoria;
        }
    }

}
