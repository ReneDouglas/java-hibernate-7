package br.edu.ifpi.config;

import br.edu.ifpi.entities.Categoria;
import br.edu.ifpi.entities.Produto;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {

    private static SessionFactory sessionFactory;

    static {
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .build();
        try {
            sessionFactory = new MetadataSources(registry)
                    .addAnnotatedClass(Categoria.class)
                    .addAnnotatedClass(Produto.class)
                    .buildMetadata()
                    .buildSessionFactory();
        } catch (Exception e) {
            StandardServiceRegistryBuilder.destroy(registry);
            throw new ExceptionInInitializerError("Falha ao criar SessionFactory: " + e);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    // so finalizar quando a aplicação encerrar
    public static void close() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }

}
