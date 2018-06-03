/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.devolution.servlet;

import br.com.devolution.dao.DaoCliente;
import br.com.devolution.dao.DaoContrato;
import br.com.devolution.dao.DaoImovel;
import br.com.devolution.model.Cliente;
import br.com.devolution.model.Contrato;
import br.com.devolution.model.Imovel;
import br.com.devolution.model.Usuario;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author luana.mpereira5
 */
@WebServlet(name = "contrato", urlPatterns = {"/contrato"})
public class ServletContrato extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DaoImovel daoImovel = new DaoImovel();
        DaoCliente daoCliente = new DaoCliente();
        Cliente cliente = new Cliente();
        Imovel imovel = new Imovel();
        String pag = null;
        HttpSession session = request.getSession();
        Usuario usuSession = (Usuario) session.getAttribute("usuAutenticado");
        String nome = usuSession.getNome();
        usuSession.getIdUsuario();

        if (request.getParameter("locatario").equals("")) {

            int codGerado = -1;
            
            try {
                cliente = daoCliente.buscarPorCpf(request.getParameter("cpf"));
                imovel.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));
                imovel = daoImovel.buscar(imovel);
                
                codGerado = DaoContrato.gerarCod();
                                                

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            request.setAttribute("codContrato", codGerado);
            request.setAttribute("imovel", imovel);
            request.setAttribute("cliente", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("venda.jsp");
            dispatcher.forward(request, response);
        }

        if (!request.getParameter("locatario").equals("") && !request.getParameter("idImovel").equals("")) {
            Contrato contrato = new Contrato();
            DaoContrato daoContrato = new DaoContrato();

            contrato.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));
            contrato.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
            contrato.setCodContrato(Integer.parseInt(request.getParameter("codContrato")));
            contrato.setDataContrato(request.getParameter("datetimepicker"));
            contrato.setDataInicial(request.getParameter("datetimepicker_de"));
            contrato.setDataFinal(request.getParameter("datetimepicker_ate"));
            
            
            try {
                daoContrato.inserir(contrato);
            } catch (SQLException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            }
            String msg="<script>alert('Contrato cadastrado com sucesso'"+usuSession.getNome()+"');</script>";
            
            request.setAttribute("msg", msg);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListarImoveis.jsp");
            dispatcher.forward(request, response);
        }

    }

}
