package br.edu.ifpi;

import br.edu.ifpi.DAO.CategoriaDAO;
import br.edu.ifpi.config.HibernateUtil;
import br.edu.ifpi.entities.Categoria;
import br.edu.ifpi.entities.ItemPedido;
import br.edu.ifpi.entities.Pedido;
import br.edu.ifpi.entities.Produto;
import org.hibernate.Session;

import java.sql.SQLException;
import java.util.List;

import static java.lang.System.out;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) throws SQLException {

        Categoria categoria = new Categoria();
        categoria.setNome("Software Engineering com Hibernate 7");
        categoria.setDescricao("teste com hibernate 7");

        //CategoriaDAO categoriaDAO = new CategoriaDAO();
        //categoriaDAO.salvar(categoria);

        /*HibernateUtil.getSessionFactory().inTransaction( session -> {
            session.persist(categoria);
        });

        out.println("Exemplo de listagem - 1");
        List<Categoria> categorias = HibernateUtil.getSessionFactory().fromTransaction(session -> {
            return session.createQuery("from Categoria", Categoria.class).getResultList();
        });

        categorias.forEach(c -> out.println(c.getId() + ", " + c.getNome() + ", " + c.getDescricao()));

        out.println("Exemplo de listagem - 2");
        HibernateUtil.getSessionFactory().inTransaction( session -> {
            session.createSelectionQuery("from Categoria", Categoria.class)
                    .getResultList()
                    .forEach( c -> out.println(c.getId() + ", " + c.getNome() + ", " + c.getDescricao()));
        });

        out.println("Exemplo de listagem - 3");
        HibernateUtil.getSessionFactory().inTransaction( session -> {
            session.createSelectionQuery("""
            SELECT c
                FROM Categoria c
            WHERE c.descricao
                LIKE :descricao
            """, Categoria.class)
                    .setParameter("descricao", "%note%")
                    .getResultList()
                    .forEach( c -> out.println(c.getId() + ", " + c.getNome() + ", " + c.getDescricao()));
        });

        HibernateUtil.close();*/

        /*HibernateUtil.getSessionFactory().inTransaction(session -> {
            session.createSelectionQuery("""
                SELECT c FROM Categoria c
                JOIN FETCH c.produtos
            """, Categoria.class)
                    .getResultList()
                    .forEach(c -> {
                        out.println(c.getId() + " - " + c.getNome() + " - " + c.getDescricao());
                        out.println("- Produtos cadastrados: " + c.getProdutos().size());
                        for (Produto p : c.getProdutos()) {
                            out.println(p.getId() + " - " + p.getNome() + " - " + p.getDescricao());
                        }
                        out.println("-- -- -- -- --");
                    });
        });*/

        HibernateUtil.getSessionFactory().inTransaction(session -> {
            session.createSelectionQuery(
        """
            SELECT p FROM Pedido p
        
        """, Pedido.class).getResultList().forEach( pedido -> {

                out.println(":: DATA DO PEDIDO: " + pedido.getDataPedido() + " :: " + pedido.getStatus() + " :: " + pedido.getValor());

                for (ItemPedido itemPedido : pedido.getItens()) {
                    out.println("> PRODUTO: [" + itemPedido.getProduto().getNome() + "] - qtde. [" + itemPedido.getQuantidade() + "] - [" + "] valor [" + itemPedido.getPrecoUnitario() + "]");
                }

            });
        });


    }

}