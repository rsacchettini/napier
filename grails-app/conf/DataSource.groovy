dataSource {
    /*
    pooled = false
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
    */
    boolean pooling = true
    String dbCreate = "update"
    String url = "jdbc:hsqldb:file:prodNapierDB"
    String driverClassName = "org.hsqldb.jdbcDriver"
    //String username = "dbo239021249"
    //String password = "JbZW4NRH"
    String username = "sa"
    String password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'org.hibernate.cache.EhCacheProvider'
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:hsqldb:file:devNapierDB"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:file:testNapierDB"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:file:prodNapierDB;shutdown=true"
        }
    }

}