from database import connect, disconnect


def _input(prompt, tipo=str):
    while True:
        valor = input(f"  {prompt}: ").strip()
        if not valor:
            print("  Campo obrigatório.")
            continue
        try:
            return tipo(valor)
        except ValueError:
            print("  Valor inválido. Tente novamente.")






def cadastrar_usuario(conn, cursor, IDUsuario, nome, sobrenome, data_nascimento, email, telefone):
    try:
        cursor.execute(
            "INSERT INTO USUARIO (IDUsuario, Nome, Sobrenome, DataNascimento, Email, NumeroTelefone) "
            "VALUES (%s, %s, %s, %s, %s, %s)",
            (IDUsuario, nome, sobrenome, data_nascimento, email, telefone))
        conn.commit()
        print(f"\n  Usuário {nome} {sobrenome} cadastrado com sucesso!")
        return True
    except Exception as e:
        conn.rollback()
        print(f"\n  Erro ao cadastrar usuário: {e}")
        return False


def cadastrar_motorista(conn, cursor, IDUsuario, foto_perfil, cnh, crlv):
    try:
        cursor.execute(
            "INSERT INTO MOTORISTA (IDMotorista, NotaMotorista, FotoPerfil, CNH, CRLV, RankingInterno) "
            "VALUES (%s, %s, %s, %s, %s, %s)",
            (IDUsuario, 5.00, foto_perfil, cnh, crlv, "Azul"))
        conn.commit()
        print(f"\n  Motorista {IDUsuario} cadastrado com sucesso!")
    except Exception as e:
        conn.rollback()
        print(f"\n  Erro ao cadastrar motorista: {e}")


def cadastrar_passageiro(conn, cursor, IDPassageiro):
    try:
        cursor.execute(
            "INSERT INTO PASSAGEIRO (IDPassageiro, NotaPassageiro) VALUES (%s, %s)",
            (IDPassageiro, 5.00))
        conn.commit()
        print(f"\n  Passageiro {IDPassageiro} cadastrado com sucesso!")
    except Exception as e:
        conn.rollback()
        print(f"\n  Erro ao cadastrar passageiro: {e}")





def servicos_motorista(cursor, IDMotorista):
    try:
        cursor.execute("""
            SELECT
                s.IDServico,
                s.DataHora,
                cat.NomeCategoria,
                p.Valor,
                p.StatusPagamento,
                p.Metodo,
                cid.NomeCidade,
                cor.LocInicio,
                cor.LocFinal,
                u_pass.Nome || ' ' || u_pass.Sobrenome  AS NomePassageiro,
                ent.LocColeta,
                ent.LocEntrega,
                ent.NomeDestinatario,
                u_rem.Nome  || ' ' || u_rem.Sobrenome   AS NomeSolicitante,
                CASE
                    WHEN cor.IDServico IS NOT NULL THEN 'Corrida'
                    WHEN ent.IDServico IS NOT NULL THEN 'Entrega'
                    ELSE 'Desconhecido'
                END AS TipoServico
            FROM SERVICO s
            JOIN CATEGORIA  cat    ON cat.IDCategoria  = s.IDCategoria
            JOIN PAGAMENTO  p      ON p.IDPagamento    = s.IDPagamento
            JOIN CIDADE     cid    ON cid.IDCidade     = s.IDCidade
            LEFT JOIN CORRIDA  cor    ON cor.IDServico    = s.IDServico
            LEFT JOIN USUARIO  u_pass ON u_pass.IDUsuario = cor.IDPassageiro
            LEFT JOIN ENTREGA  ent    ON ent.IDServico    = s.IDServico
            LEFT JOIN USUARIO  u_rem  ON u_rem.IDUsuario  = ent.IDUsuario
            WHERE s.IDMotorista = %s
            ORDER BY s.DataHora DESC
        """, (IDMotorista,))

        servicos = cursor.fetchall()

        if not servicos:
            print(f"\n  Nenhum serviço encontrado para o motorista {IDMotorista}.")
            return

        print(f"\n{'─' * 56}")
        print(f"  SERVIÇOS DO MOTORISTA {IDMotorista}  ({len(servicos)} registro(s))")
        print(f"{'─' * 56}")

        for (id_serv, datahora, categoria, valor, status_pag, metodo,
             cidade, loc_inicio, loc_final, nome_passageiro,
             loc_coleta, loc_entrega, nome_dest, nome_solicitante, tipo) in servicos:

            print(f"\n  #{id_serv}  {datahora.strftime('%d/%m/%Y %H:%M')}  [{tipo}]")
            print(f"  Categoria   : {categoria}")
            print(f"  Cidade      : {cidade}")
            print(f"  Pagamento   : R$ {valor:.2f}  via {metodo}  ({status_pag})")

            match tipo:
                case "Corrida":
                    print(f"  Passageiro  : {nome_passageiro}")
                    print(f"  Origem      : {loc_inicio}")
                    print(f"  Destino     : {loc_final}")
                case "Entrega":
                    print(f"  Solicitante : {nome_solicitante}")
                    print(f"  Destinatário: {nome_dest}")
                    print(f"  Coleta      : {loc_coleta}")
                    print(f"  Entrega     : {loc_entrega}")

            print("·" * 56)

    except Exception as e:
        print(f"\n  Erro ao consultar serviços: {e}")


def visualizar_usuario(cursor, IDUsuario):
    try:
        cursor.execute("""
            SELECT
                u.IDUsuario,
                u.Nome,
                u.Sobrenome,
                u.DataNascimento,
                u.Email,
                u.NumeroTelefone,
                m.NotaMotorista,
                m.CNH,
                m.CRLV,
                m.RankingInterno,
                p.NotaPassageiro
            FROM USUARIO u
            LEFT JOIN MOTORISTA  m ON m.IDMotorista  = u.IDUsuario
            LEFT JOIN PASSAGEIRO p ON p.IDPassageiro = u.IDUsuario
            WHERE u.IDUsuario = %s
        """, (IDUsuario,))

        row = cursor.fetchone()

        if not row:
            print(f"\n  Usuário {IDUsuario} não encontrado.")
            return

        (id_u, nome, sobrenome, nasc, email, telefone,
         nota_mot, cnh, crlv, ranking, nota_pass) = row

        print(f"\n{'─' * 56}")
        print(f"  USUÁRIO #{id_u}")
        print(f"{'─' * 56}")
        print(f"  Nome        : {nome} {sobrenome}")
        print(f"  Nascimento  : {nasc.strftime('%d/%m/%Y')}")
        print(f"  E-mail      : {email}")
        print(f"  Telefone    : {telefone}")

        if nota_mot is not None:
            print(f"\n  [ MOTORISTA ]")
            print(f"  Nota        : {nota_mot:.2f}")
            print(f"  CNH         : {cnh}")
            print(f"  CRLV        : {crlv}")
            print(f"  Ranking     : {ranking}")

        if nota_pass is not None:
            print(f"\n  [ PASSAGEIRO ]")
            print(f"  Nota        : {nota_pass:.2f}")

        if nota_mot is None and nota_pass is None:
            print(f"\n  Sem perfil de motorista ou passageiro.")

    except Exception as e:
        print(f"\n  Erro ao consultar usuário: {e}")




def avaliar_servico(conn, cursor, IDServico, tipo_avaliado, nota, descricao):
    try:
        cursor.execute("SELECT COALESCE(MAX(IDAvaliacao), 0) + 1 FROM AVALIACAO")
        novo_id = cursor.fetchone()[0]

        cursor.execute(
            "INSERT INTO AVALIACAO (IDAvaliacao, TipoAvaliado, NotaAvaliacao, DescricaoAvaliacao, IDServico) "
            "VALUES (%s, %s, %s, %s, %s)",
            (novo_id, tipo_avaliado, nota, descricao, IDServico))
        conn.commit()
        print(f"\n  Avaliação #{novo_id} registrada!")

        if tipo_avaliado == "Motorista":
            cursor.execute("SELECT IDMotorista FROM SERVICO WHERE IDServico = %s", (IDServico,))
            row = cursor.fetchone()
            if row:
                atualizar_nota_motorista(conn, cursor, row[0])
        else:
            cursor.execute("SELECT IDPassageiro FROM CORRIDA WHERE IDServico = %s", (IDServico,))
            row = cursor.fetchone()
            if row:
                atualizar_nota_passageiro(conn, cursor, row[0])

    except Exception as e:
        conn.rollback()
        print(f"\n  Erro ao registrar avaliação: {e}")


def atualizar_nota_motorista(conn, cursor, IDMotorista):
    try:
        cursor.execute("""
            SELECT ROUND(AVG(a.NotaAvaliacao)::NUMERIC, 2)
            FROM AVALIACAO a
            JOIN SERVICO s ON s.IDServico = a.IDServico
            WHERE s.IDMotorista = %s
              AND a.TipoAvaliado = 'Motorista'
        """, (IDMotorista,))

        resultado = cursor.fetchone()
        nova_nota = float(resultado[0]) if resultado and resultado[0] is not None else 5.00

        cursor.execute(
            "UPDATE MOTORISTA SET NotaMotorista = %s WHERE IDMotorista = %s",
            (nova_nota, IDMotorista))
        conn.commit()
        print(f"\n  Nota do motorista {IDMotorista} atualizada para {nova_nota:.2f}.")

    except Exception as e:
        conn.rollback()
        print(f"\n  Erro ao atualizar nota do motorista: {e}")


def atualizar_nota_passageiro(conn, cursor, IDPassageiro):
    try:
        cursor.execute("""
            SELECT ROUND(AVG(a.NotaAvaliacao)::NUMERIC, 2)
            FROM AVALIACAO a
            JOIN SERVICO s   ON s.IDServico  = a.IDServico
            JOIN CORRIDA cor ON cor.IDServico = s.IDServico
            WHERE cor.IDPassageiro = %s
              AND a.TipoAvaliado = 'Solicitante'
        """, (IDPassageiro,))

        resultado = cursor.fetchone()
        nova_nota = float(resultado[0]) if resultado and resultado[0] is not None else 5.00

        cursor.execute(
            "UPDATE PASSAGEIRO SET NotaPassageiro = %s WHERE IDPassageiro = %s",
            (nova_nota, IDPassageiro))
        conn.commit()
        print(f"\n  Nota do passageiro {IDPassageiro} atualizada para {nova_nota:.2f}.")

    except Exception as e:
        conn.rollback()
        print(f"\n  Erro ao atualizar nota do passageiro: {e}")


def deletar_usuario(conn, cursor, IDUsuario):
    try:
        cursor.execute("SELECT IDServico FROM SERVICO WHERE IDMotorista = %s", (IDUsuario,))
        ids = [r[0] for r in cursor.fetchall()]

        cursor.execute("SELECT IDServico FROM CORRIDA WHERE IDPassageiro = %s", (IDUsuario,))
        ids += [r[0] for r in cursor.fetchall()]

        cursor.execute("SELECT IDServico FROM ENTREGA WHERE IDUsuario = %s", (IDUsuario,))
        ids += [r[0] for r in cursor.fetchall()]

        ids = list(set(ids))

        if ids:
            ph = ",".join(["%s"] * len(ids))
            cursor.execute(f"DELETE FROM RESERVACORRIDA WHERE IDServico  IN ({ph})", ids)
            cursor.execute(f"DELETE FROM AVALIACAO      WHERE IDServico  IN ({ph})", ids)
            cursor.execute(f"DELETE FROM CANCELAMENTO   WHERE IDServico  IN ({ph})", ids)
            cursor.execute(f"DELETE FROM CORRIDA        WHERE IDServico  IN ({ph})", ids)
            cursor.execute(f"DELETE FROM ENTREGA        WHERE IDServico  IN ({ph})", ids)
            cursor.execute(f"DELETE FROM SERVICO        WHERE IDServico  IN ({ph})", ids)

        # Reservas pendentes sem serviço ainda (IDServico é nullable)
        cursor.execute("DELETE FROM RESERVACORRIDA WHERE IDPassageiro = %s", (IDUsuario,))

        cursor.execute("DELETE FROM CONDUZ     WHERE IDMotorista  = %s", (IDUsuario,))
        cursor.execute("DELETE FROM MOTORISTA  WHERE IDMotorista  = %s", (IDUsuario,))
        cursor.execute("DELETE FROM PASSAGEIRO WHERE IDPassageiro = %s", (IDUsuario,))
        cursor.execute("DELETE FROM USUARIO    WHERE IDUsuario    = %s", (IDUsuario,))

        conn.commit()
        print(f"\n  Usuário {IDUsuario} e todos os dados relacionados removidos.")

    except Exception as e:
        conn.rollback()
        print(f"\n  Erro ao deletar usuário: {e}")





if __name__ == "__main__":

    conn = connect()

    if not conn:
        exit(1)

    cursor = conn.cursor()
    cursor.execute("SET search_path = UBER;")

    try:
        while True:
            cursor.execute("SET search_path = UBER;")

            print("""
╔══════════════════════════════════════════╗
║           SISTEMA UBER  ─  MENU          ║
╠══════════════════════════════════════════╣
║  1. Cadastrar usuário                    ║
║  2. Visualizar usuário                   ║
║  3. Ver serviços de um motorista         ║
║  4. Avaliar serviço                      ║
║  5. Recalcular nota de motorista         ║
║  6. Recalcular nota de passageiro        ║
║  7. Deletar usuário                      ║
║  0. Sair                                 ║
╚══════════════════════════════════════════╝""")

            opcao = input("\n  Escolha uma opção: ").strip()

            match opcao:
                case "1":
                    print("\n─── CADASTRAR USUÁRIO ───")
                    id_novo = _input("ID do usuário", int)
                    sucesso = cadastrar_usuario(
                        conn, cursor,
                        id_novo,
                        _input("Nome"),
                        _input("Sobrenome"),
                        _input("Data de nascimento (YYYY-MM-DD)"),
                        _input("E-mail"),
                        _input("Telefone"),
                    )
                    if sucesso:
                        tipo = input("\n  Tipo de usuário — (M) Motorista / (P) Passageiro: ").strip().upper()
                        match tipo:
                            case "M":
                                cadastrar_motorista(
                                    conn, cursor,
                                    id_novo,
                                    _input("URL da foto de perfil"),
                                    _input("CNH"),
                                    _input("CRLV"),
                                )
                            case "P":
                                cadastrar_passageiro(conn, cursor, id_novo)
                            case _:
                                print("\n  Tipo inválido. Usuário base criado sem perfil.")

                case "2":
                    print("\n─── VISUALIZAR USUÁRIO ───")
                    visualizar_usuario(cursor, _input("ID do usuário", int))

                case "3":
                    print("\n─── SERVIÇOS DO MOTORISTA ───")
                    servicos_motorista(cursor, _input("ID do motorista", int))

                case "4":
                    print("\n─── AVALIAR USUÁRIO ───")
                    quem = input("  Avaliar (M) Motorista / (S) Solicitante: ").strip().upper()
                    if quem not in ("M", "S"):
                        print("\n  Opção inválida.")
                    else:
                        id_avaliado = _input("ID do usuário a avaliar", int)

                        if quem == "M":
                            cursor.execute(
                                "SELECT IDServico FROM SERVICO WHERE IDMotorista = %s "
                                "ORDER BY DataHora DESC LIMIT 1",
                                (id_avaliado,))
                        else:
                            cursor.execute(
                                "SELECT s.IDServico FROM SERVICO s "
                                "JOIN CORRIDA cor ON cor.IDServico = s.IDServico "
                                "WHERE cor.IDPassageiro = %s ORDER BY s.DataHora DESC LIMIT 1",
                                (id_avaliado,))

                        row = cursor.fetchone()
                        if not row:
                            print("\n  Nenhum serviço encontrado para esse usuário.")
                        else:
                            nota = _input("Nota (1 a 5)", int)
                            if nota not in range(1, 6):
                                print("\n  Nota deve ser entre 1 e 5.")
                            else:
                                desc = input("  Descrição (opcional, Enter para pular): ").strip() or None
                                tipo_av = "Motorista" if quem == "M" else "Solicitante"
                                avaliar_servico(conn, cursor, row[0], tipo_av, nota, desc)

                case "5":
                    print("\n─── RECALCULAR NOTA — MOTORISTA ───")
                    atualizar_nota_motorista(conn, cursor, _input("ID do motorista", int))

                case "6":
                    print("\n─── RECALCULAR NOTA — PASSAGEIRO ───")
                    atualizar_nota_passageiro(conn, cursor, _input("ID do passageiro", int))

                case "7":
                    print("\n─── DELETAR USUÁRIO ───")
                    id_u = _input("ID do usuário", int)
                    conf = input(
                        f"\n  ATENÇÃO: todos os dados do usuário {id_u} serão removidos.\n"
                        "  Digite CONFIRMAR para prosseguir: "
                    ).strip()
                    if conf == "CONFIRMAR":
                        deletar_usuario(conn, cursor, id_u)
                    else:
                        print("\n  Operação cancelada.")

                case "0":
                    print("\n  Até logo!\n")
                    break

                case _:
                    print("\n  Opção inválida.")

    finally:
        disconnect(conn)
