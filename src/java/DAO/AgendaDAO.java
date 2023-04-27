package DAO;

import Model.Agenda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class AgendaDAO {

    Connection conexao;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Agenda> contatos = new ArrayList<>();

    //Construtor da classe que conterá a conexão com o banco de dados.
    //inicializada
    public AgendaDAO() throws ClassNotFoundException {
        conexao = new ConexaoBanco().getConexao();
        //Atribuindo a conexão com o banco de dados ao atributo conexao
    }
    
    //Método para cadastrar um novo contato
    public void cadastrarContato(Agenda contato) throws SQLException{
        String sql = "INSERT INTO contato(nome, ddd, numero) VALUES(?,?,?)";
        
        pstm = conexao.prepareStatement(sql);
        pstm.setString(1, contato.getNome());
        pstm.setString(2, contato.getDdd());
        pstm.setString(3, contato.getNumero());
        
        pstm.execute();
        pstm.close();
    }
    
    //Método para atualizar o contato
    public void atualizarContato(Agenda contato) throws SQLException{
        String sql = "UPDATE contato SET nome=?, ddd=?, numero=? WHERE idContato=?";
        
        pstm = conexao.prepareStatement(sql);
        pstm.setString(1, contato.getNome());
        pstm.setString(2, contato.getDdd());
        pstm.setString(3, contato.getNumero());
        pstm.setInt(4, contato.getIdContato());
        
        pstm.execute();
        pstm.close();
    }
    //Método para deletar um produto.
    public void excluirContato(int id) throws SQLException{
        String sql = "DELETE FROM contato WHERE idContato = ?";
        pstm = conexao.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        pstm.close();
    }
    //Metodo para listar os contatos:
    public ArrayList<Agenda> listarContatos() throws SQLException{
     String sql = "SELECT * FROM contato";
     pstm = conexao.prepareStatement(sql);
     rs = pstm.executeQuery();
        while(rs.next()){
            Agenda contato = new Agenda();
            contato.setIdContato(rs.getInt("idContato"));
            contato.setNome(rs.getString("Nome"));
            contato.setDdd(rs.getString("Ddd"));
            contato.setNumero(rs.getString("Numero"));
         
     contatos.add(contato);
     }
     return contatos;
}
}
