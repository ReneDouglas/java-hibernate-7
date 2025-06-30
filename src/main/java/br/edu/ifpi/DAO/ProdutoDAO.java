package br.edu.ifpi.DAO;


import br.edu.ifpi.entities.Produto;

import java.sql.SQLException;
import java.util.List;

public class ProdutoDAO implements GenericDAO<Produto, Integer>{


    @Override
    public void salvar(Produto produto) throws SQLException {

    }

    @Override
    public void excluir(Produto produto) throws SQLException {

    }

    @Override
    public void alterar(Produto produto) throws SQLException {

    }

    @Override
    public List<Produto> listar() throws SQLException {
        return List.of();
    }

    @Override
    public Produto buscarPorId(Integer id) throws SQLException {
        return null;
    }
}
