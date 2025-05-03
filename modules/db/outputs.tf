output "server_psql_id" {
  description = "value of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.psql.id
}