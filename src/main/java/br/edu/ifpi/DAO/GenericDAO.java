package br.edu.ifpi.DAO;

import java.sql.SQLException;
import java.util.List;

public interface GenericDAO<T, ID> {

    void salvar(T t) throws SQLException;
    void excluir(T t) throws SQLException;
    void alterar(T t) throws SQLException;
    List<T> listar() throws SQLException;
    T buscarPorId(ID id) throws SQLException;

}
