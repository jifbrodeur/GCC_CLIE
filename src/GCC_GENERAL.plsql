CREATE OR REPLACE Package body Gcc_general as
  Procedure PROC_charge_package as
    /* Procédure pour charger le package en mémoire */
  Begin
    null;
  End PROC_charge_package;

  Function FONC_generer_notran_gcc RETURN number as
    L_no_tran gcc_tran_clie.no_tran%type := null;
    --
  Begin
    Select gccs_notran.nextval into L_no_tran from dual;
    --
    Return(L_no_tran);
  Exception
    when others then
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20101',
                                                              'GCC');
      raise_application_error(-20101,
                              GSY_general_2.FONC_rech_mess('20101', 'GCC'));
  End FONC_generer_notran_gcc;

  Function FONC_generer_noecri_gcc RETURN number as
    L_no_ecri gcc_ecri_clie.no_ecri%type := null;
    --
  Begin
    Select gccs_noecri.nextval into L_no_ecri from dual;
    --
    Return(L_no_ecri);
  Exception
    when others then
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20102',
                                                              'GCC');
      raise_application_error(-20102,
                              GSY_general_2.FONC_rech_mess('20102', 'GCC'));
  End FONC_generer_noecri_gcc;

  Function FONC_generer_noclie_gcc RETURN number as
    L_no_clie_gcc gcc_clie.no_clie%TYPE;
    Cursor sel_clie is
      Select 'x' from gcc_clie GC where GC.no_clie = L_no_clie_gcc;
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_CLIE dans la table GCC_CLIE */
    LOOP
      select gccs_noclie.nextval into L_no_clie_gcc from dual;
      if (L_tampon = L_no_clie_gcc) then
        if (sel_clie%ISOPEN) then
          close sel_clie;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := L_no_clie_gcc;
      end if;
      open sel_clie;
      fetch sel_clie
        into L_bidon;
      exit when sel_clie%NOTFOUND;
      close sel_clie;
    END LOOP;
    if (sel_clie%ISOPEN) then
      close sel_clie;
    end if;
    Return(L_no_clie_gcc);
  Exception
    when sequence_limite then
      /*     raise_application_error(-20204,'IMPOSSIBLE de générer la séquence - '
      ||'Contacter votre vendeur.');   F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20100',
                                                              'GCC');
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_clie%ISOPEN) then
        close sel_clie;
      end if;
      /*      raise_application_error(-20205,'ERREUR dans la FONC_generer_noclie_gcc - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20103',
                                                              'GCC');
      raise_application_error(-20103,
                              GSY_general_2.FONC_rech_mess('20103', 'GCC'));
  End FONC_generer_noclie_gcc;
  Function FONC_generer_nodepo_gcc RETURN number as
    l_no_depo_gcc gcc_depo.no_depo%TYPE;
    cursor sel_depo is
      select 'x' from gcc_depo GD where GD.no_depo = l_no_depo_gcc;
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_DEPO dans la table GCC_DEPO */
    LOOP
      select gccs_nodepo.nextval into l_no_depo_gcc from dual;
      if (L_tampon = l_no_depo_gcc) then
        if (sel_depo%ISOPEN) then
          close sel_depo;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := l_no_depo_gcc;
      end if;
      open sel_depo;
      fetch sel_depo
        into L_bidon;
      exit when sel_depo%NOTFOUND;
      close sel_depo;
    END LOOP;
    if (sel_depo%ISOPEN) then
      close sel_depo;
    end if;
    Return(L_no_depo_gcc);
  Exception
    when sequence_limite then
      /*     raise_application_error(-20206,'IMPOSSIBLE de générer la séquence - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20100',
                                                              'GCC');
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_depo%ISOPEN) then
        close sel_depo;
      end if;
      /*     raise_application_error(-20207,'ERREUR dans la FONC_generer_nodepo_gcc - '
      ||'Contacter votre vendeur.');   F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20104',
                                                              'GCC');
      raise_application_error(-20104,
                              GSY_general_2.FONC_rech_mess('20104', 'GCC'));
  End FONC_generer_nodepo_gcc;
  Function FONC_generer_nopubl_gcc RETURN number as
    l_no_publ_gcc gcc_medi.no_publ%TYPE;
    Cursor sel_medi is
      Select 'x' from gcc_medi GM where GM.no_publ = l_no_publ_gcc;
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_PUBL dans la table GCC_MEDI */
    LOOP
      Select GCCS_nopubl.nextval into l_no_publ_gcc from dual;
      if (L_tampon = l_no_publ_gcc) then
        if (sel_medi%ISOPEN) then
          close sel_medi;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := l_no_publ_gcc;
      end if;
      open sel_medi;
      fetch sel_medi
        into L_bidon;
      exit when sel_medi%NOTFOUND;
      close sel_medi;
    END LOOP;
    if (sel_medi%ISOPEN) then
      close sel_medi;
    end if;
    Return(L_no_publ_gcc);
  Exception
    when sequence_limite then
      /*       raise_application_error(-20208,'IMPOSSIBLE de générer la séquence - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20100',
                                                              'GCC');
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_medi%ISOPEN) then
        close sel_medi;
      end if;
      /*     raise_application_error(-20209,'ERREUR dans la FONC_generer_nopubl_gcc - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20105',
                                                              'GCC');
      raise_application_error(-20105,
                              GSY_general_2.FONC_rech_mess('20105', 'GCC'));
  End FONC_generer_nopubl_gcc;
  Function FONC_generer_norece_gcc RETURN number as
    l_no_rece_gcc gcc_rece.no_rece%TYPE;
    cursor sel_rece is
      select 'x' from gcc_rece GR where GR.no_rece = l_no_rece_gcc;
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_RECE dans la table GCC_RECE */
    LOOP
      select GCCS_NORECE.nextval into l_no_rece_gcc from dual;
      if (L_tampon = l_no_rece_gcc) then
        if (sel_rece%ISOPEN) then
          close sel_rece;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := l_no_rece_gcc;
      end if;
      open sel_rece;
      fetch sel_rece
        into L_bidon;
      exit when sel_rece%NOTFOUND;
      close sel_rece;
    END LOOP;
    if (sel_rece%ISOPEN) then
      close sel_rece;
    end if;
    Return(L_no_rece_gcc);
  Exception
    when sequence_limite then
      /*       raise_application_error(-20210,'IMPOSSIBLE de générer la séquence - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20100',
                                                              'GCC');
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_rece%ISOPEN) then
        close sel_rece;
      end if;
      /*     raise_application_error(-20211,'ERREUR dans la FONC_generer_norece_gcc - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20106',
                                                              'GCC');
      raise_application_error(-20106,
                              GSY_general_2.FONC_rech_mess('20106', 'GCC'));
  End FONC_generer_norece_gcc;
  Function FONC_generer_nocont_gcc RETURN number as
    L_no gcc_pers_cont.no_cont%TYPE;
    cursor sel_no is
      select 'x' from gcc_pers_cont GEC where GEC.no_cont = L_no;
    Sequence_limite Exception;
    L_tampon  gcc_pers_cont.no_cont%TYPE := 0;
    L_passage varchar2(1) := 'N';
    L_bidon   varchar2(1) := null;
  Begin
    /* Génération d'un NO_CONT dans la table GCC_PERS_CONT */
    LOOP
      Select gccs_nocont.nextval into L_no from dual;
      if (L_tampon = L_no) then
        if (sel_no%ISOPEN) then
          close sel_no;
        end if;
        raise Sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := L_no;
      end if;
      open sel_no;
      fetch sel_no
        into L_bidon;
      exit when sel_no%NOTFOUND;
      close sel_no;
    END LOOP;
    if (sel_no%ISOPEN) then
      close sel_no;
    end if;
    Return(L_no);
  Exception
    when Sequence_limite then
      /*       raise_application_error(-20202,'IMPOSSIBLE de générer la séquence - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20100',
                                                              'GCC');
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_no%ISOPEN) then
        close sel_no;
      end if;
      /*    raise_application_error(-20203,'ERREUR dans la FONC_generer_nocont_gcc - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20107',
                                                              'GCC');
      raise_application_error(-20107,
                              GSY_general_2.FONC_rech_mess('20107', 'GCC'));
  End FONC_generer_nocont_gcc;
  Function FONC_generer_nocate_gcc RETURN number as
    L_no gcc_cate_clie.no_cate%TYPE;
    cursor sel_no is
      select 'x' from gcc_cate_clie GEC where GEC.no_cate = L_no;
    Sequence_limite Exception;
    L_tampon  gcc_cate_clie.no_cate%TYPE := 0;
    L_passage varchar2(1) := 'N';
    L_bidon   varchar2(1) := null;
  Begin
    /* Génération d'un NO_CATE dans la table GCC_CATE_CLIE */
    LOOP
      Select gccs_nocate.nextval into L_no from dual;
      if (L_tampon = L_no) then
        if (sel_no%ISOPEN) then
          close sel_no;
        end if;
        raise Sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := L_no;
      end if;
      open sel_no;
      fetch sel_no
        into L_bidon;
      exit when sel_no%NOTFOUND;
      close sel_no;
    END LOOP;
    if (sel_no%ISOPEN) then
      close sel_no;
    end if;
    Return(L_no);
  Exception
    when Sequence_limite then
      /*     raise_application_error(-20202,'IMPOSSIBLE de générer la séquence - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20100',
                                                              'GCC');
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_no%ISOPEN) then
        close sel_no;
      end if;
      /*      raise_application_error(-20203,'ERREUR dans la FONC_generer_nocate_gcc - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20108',
                                                              'GCC');
      raise_application_error(-20108,
                              GSY_general_2.FONC_rech_mess('20108', 'GCC'));
  End FONC_generer_nocate_gcc;
  Function FONC_generer_notypedepo_gcc RETURN number as
    l_no_type_depo_gcc gcc_type_depo.no_type_depo%TYPE;
    cursor sel_type_depo is
      select 'x'
        from gcc_type_depo GD
       where GD.no_type_depo = l_no_type_depo_gcc;
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_TYPE_DEPO dans la table GCC_TYPE_DEPO */
    LOOP
      select gccs_notypedepo.nextval into l_no_type_depo_gcc from dual;
      if (L_tampon = l_no_type_depo_gcc) then
        if (sel_type_depo%ISOPEN) then
          close sel_type_depo;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := l_no_type_depo_gcc;
      end if;
      open sel_type_depo;
      fetch sel_type_depo
        into L_bidon;
      exit when sel_type_depo%NOTFOUND;
      close sel_type_depo;
    END LOOP;
    if (sel_type_depo%ISOPEN) then
      close sel_type_depo;
    end if;
    Return(l_no_type_depo_gcc);
  Exception
    when sequence_limite then
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20100',
                                                              'GCC');
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_type_depo%ISOPEN) then
        close sel_type_depo;
      end if;
      GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20113',
                                                              'GCC');
      raise_application_error(-20113,
                              GSY_general_2.FONC_rech_mess('20113', 'GCC'));
  End FONC_generer_notypedepo_gcc;
  -- fait par JB le 27 mars 2002
  Function FONC_generer_noacceprod_gcc RETURN number is
    L_no number;
  Begin
    L_no := GSY_general_2.FP_gene_sequ('GCC_ACCE_PROD',
                                       'NO_ACCE_PROD',
                                       'GCCS_NOACCEPROD_GCC');
    Return(L_no);
  End FONC_generer_noacceprod_gcc;
  --
  Function FONC_age_cpte_gcc(P_no_clie Number, -- No de client
                             P_date    varchar2 -- Date de l'age des comptes
                             ) Return varchar2 is
    /* Déclaration des variables */
    L_en_date             date;
    L_form_masq_date_orac varchar2(20); -- Format masque de la date
    L_limi_1              Number; -- Première Limite
    L_limi_2              Number; -- Deuxième Limite
    L_limi_3              Number; -- Troisième Limite
    L_mont_docu_cour      Number; -- Montant du courant
    L_mont_docu_limi1     Number; -- Montant du limite 1
    L_mont_docu_limi2     Number; -- Montant du limite 2
    L_mont_docu_limi3     Number; -- Montant du limite 3
    L_mont_docu_apre      Number; -- Montant du apres L_en_date
    L_mont_paye_cour      Number; -- Montant payé courant
    L_mont_paye_limi1     Number; -- Montant payé limite 1
    L_mont_paye_limi2     Number; -- Montant payé limite 2
    L_mont_paye_limi3     Number; -- Montant payé limite 3
    L_mont_paye_apre      Number; -- Montant payé apres L_en_date
    L_tota_cour           Number; -- Montant total du courant
    L_tota_limi1          Number; -- Montant total du limite 1
    L_tota_limi2          Number; -- Montant total du limite 2
    L_tota_limi3          Number; -- Montant total du limite 3
    L_chaine              Varchar2(2000); -- Chaine de retour
    L_mode                Varchar2(1) := NVL(GSY_GENERAL.FONC_OBTE_VALE_PARA('MODE_CALC_LIMI'),
                                             'J');
    /* Sommes des documents Factures,Débits,Crédits,Ajustements,Avances */
    -- Prend tout les documents ainsi que les avances (table gcc_tran_clie.mont_paye_ouve)
    -- Tient compte du cas de Hélix (une facture plusieurs payeurs)
    Cursor sel_docu is
      select trunc(t.date_tran) date_tran,
             t.type_tran,
             v.mont,
             v.mont_paye_ouve,
             t.type_ajus
      -- remé par jgf, le 28/09/00 t.mont_paye_ouve
        from gcc_tran_clie t,
             gcc_tran_vent v,
             gsy_cont_lot  l,
             gsy_type_lot  tl
       where t.no_tran = v.no_tran
         and t.no_lot = l.no_lot
         and l.no_type_lot = tl.no_type_lot
         and tl.affe_suiv_comp = 'O'
         -- on prend les factures, les crédit, les débits, les paiements et les ajustements (sauf les annulations)
         and (type_tran in ('F','C','D','P') or (type_tran = 'A' and (type_ajus != 'P' or (type_ajus = 'P' and nvl(annu_paie,'N') !='O'))))
         and v.no_clie = p_no_clie
      union all -- all ajouté par jgf, pour avoir tous les enregistrements
      select trunc(t.date_tran) date_tran,
             t.type_tran,
             t.montant,
             t.mont_paye_ouve,
             t.type_ajus
        from gcc_tran_clie t, gsy_cont_lot l, gsy_type_lot tl
       where (t.type_tran = 'P' and t.mont_paye_ouve <> 0)
         and t.no_lot = l.no_lot
         and l.no_type_lot = tl.no_type_lot
         and tl.affe_suiv_comp = 'O'
         and t.no_clie = p_no_clie;
    enr_docu sel_docu%rowtype;
    /* Sommes des Paiements */
    -- modification du curseur pour tenir compte de la distribution des
    -- transactions ventillées ex: cas de Hélix (plusieurs payeurs sur un document)
    Cursor sel_paie is
      Select D.date_tran_fact, v.montant, d.date_tran_paie
        From gcc_dist_paie      D,
             gcc_dist_paie_vent v,
             gcc_tran_clie      c,
             gsy_cont_lot       l,
             gsy_type_lot       tl
       where d.no_tran_fact = v.no_tran_fact
         and d.no_tran_paie = v.no_tran_paie
         and d.no_tran_paie = c.no_tran
         and c.no_lot = l.no_lot
         and l.no_type_lot = tl.no_type_lot
         and tl.affe_suiv_comp = 'O'
         -- on prend pas les ajustements, sauf les annulations
         and (c.type_tran != 'A'
               or
              (c.type_tran = 'A' and c.type_ajus = 'P' and annu_paie = 'O'
                 and not exists (select no_tran from gcc_tran_clie
                                   where type_tran = 'P' and no_tran = c.no_tran_paie
                                     and type_tran_paie = 'D'))
             )
         and V.no_clie = P_no_clie; -- ajout par jgf, le 03/05/01 , il faut tenir compte de la ventilation
    --      D.no_clie = P_no_clie; mis en comm., par jgf, le 03/05/2001
    enr_paie sel_paie%rowtype;
  Begin
    if not(GCC_general.list_chaine.EXISTS(to_char(P_no_clie))) then    -- Dans ce cas, on doit recalculer ....

    /* Obtenir les valeurs des paramètres */
    GCC_general.LP_limi_1 := GSY_general.FONC_obte_vale_para('LIMI_1_CC');
    GCC_general.LP_limi_2 := GSY_general.FONC_obte_vale_para('LIMI_2_CC');
    GCC_general.LP_limi_3 := GSY_general.FONC_obte_vale_para('LIMI_3_CC');
    L_limi_1              := GCC_general.LP_limi_1;
    L_limi_2              := GCC_general.LP_limi_2;
    L_limi_3              := GCC_general.LP_limi_3;
    if (GCC_general.LP_form_masq_date_orac is null) then
      GCC_general.LP_form_masq_date_orac := GSY_general.FONC_form_masq_date_orac;
    end if;
    L_form_masq_date_orac := GCC_general.LP_form_masq_date_orac;
    -- Convertir la date
    -- modif. JFL en date du 07/02/2001
    L_en_date := GCC_GENERAL_2.Fonc_calc_date(to_date(P_date,
                                                      L_form_masq_date_orac),
                                              0,
                                              L_mode);
    -- Calculer les sommes dus selon les périodes
    open sel_docu;
    Loop
      fetch sel_docu
        into enr_docu;
      exit when sel_docu%notfound;
      -- modif. JFL en date du 07/02/2001 pour que le calcul des limites en date ou en mois
      -- entre le 14/01/2001 au 13/02/2001
      if (enr_docu.date_tran between
         GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_1, L_mode) and
         L_en_date) then
        if (enr_docu.type_tran = 'P') then
          L_mont_docu_cour := nvl(L_mont_docu_cour, 0) +
                              nvl(enr_docu.mont_paye_ouve, 0);
        else
          -- ajout par chanthol 05-02-2001
          -- Pour que les ajustement de paiement en positif
          if (enr_docu.type_tran = 'A' and enr_docu.type_ajus = 'P' and
             sign(enr_docu.mont) = 1) then
            L_mont_docu_cour := nvl(L_mont_docu_cour, 0) -
                                nvl(enr_docu.mont, 0);
          else
            -- Pour que les ajustement de paiement en négatif
            if (enr_docu.type_tran = 'A' and enr_docu.type_ajus = 'P' and
               sign(enr_docu.mont) = -1) then
              L_mont_docu_cour := nvl(L_mont_docu_cour, 0) +
                                  abs(nvl(enr_docu.mont, 0));
            else
              L_mont_docu_cour := nvl(L_mont_docu_cour, 0) +
                                  nvl(enr_docu.mont, 0);
            end if;
          end if;
          -- fin de l'ajout
          -- L_mont_docu_cour := nvl(L_mont_docu_cour,0) + nvl(enr_docu.mont,0);
        end if;
        -- modif. JFL en date du 07/02/2001
        -- elsif (enr_docu.date_tran between L_en_date-L_limi_2 and L_en_date-L_limi_1-1) then
      elsif (enr_docu.date_tran between
            GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_2, L_mode) and
            GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_1 + 1, L_mode)) then
        if (enr_docu.type_tran = 'P') then
          L_mont_docu_limi1 := nvl(L_mont_docu_limi1, 0) +
                               nvl(enr_docu.mont_paye_ouve, 0);
        else
          -- ajout par chanthol 05-02-2001
          -- Pour que les ajustement de paiement en positif
          if (enr_docu.type_tran = 'A' and enr_docu.type_ajus = 'P' and
             sign(enr_docu.mont) = 1) then
            L_mont_docu_limi1 := nvl(L_mont_docu_limi1, 0) -
                                 nvl(enr_docu.mont, 0);
          else
            -- Pour que les ajustement de paiement en négatif
            if (enr_docu.type_tran = 'A' and enr_docu.type_ajus = 'P' and
               sign(enr_docu.mont) = -1) then
              L_mont_docu_limi1 := nvl(L_mont_docu_limi1, 0) +
                                   abs(nvl(enr_docu.mont, 0));
            else
              L_mont_docu_limi1 := nvl(L_mont_docu_limi1, 0) +
                                   nvl(enr_docu.mont, 0);
            end if;
          end if;
          -- fin de l'ajout
          -- L_mont_docu_limi1 := nvl(L_mont_docu_limi1,0) + nvl(enr_docu.mont,0);
        end if;
        --  elsif (enr_docu.date_tran between L_en_date-L_limi_3 and L_en_date-L_limi_2-1) then
        -- modif JFL en date du 07/02/2001
      elsif (enr_docu.date_tran between
            GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_3, L_mode) and
            GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_2 + 1, L_mode)) then
        if (enr_docu.type_tran = 'P') then
          L_mont_docu_limi2 := nvl(L_mont_docu_limi2, 0) +
                               nvl(enr_docu.mont_paye_ouve, 0);
        else
          -- ajout par chanthol 05-02-2001
          -- Pour que les ajustement de paiement en positif
          if (enr_docu.type_tran = 'A' and enr_docu.type_ajus = 'P' and
             sign(enr_docu.mont) = 1) then
            L_mont_docu_limi2 := nvl(L_mont_docu_limi2, 0) -
                                 nvl(enr_docu.mont, 0);
          else
            -- Pour que les ajustement de paiement en négatif
            if (enr_docu.type_tran = 'A' and enr_docu.type_ajus = 'P' and
               sign(enr_docu.mont) = -1) then
              L_mont_docu_limi2 := nvl(L_mont_docu_limi2, 0) +
                                   abs(nvl(enr_docu.mont, 0));
            else
              L_mont_docu_limi2 := nvl(L_mont_docu_limi2, 0) +
                                   nvl(enr_docu.mont, 0);
            end if;
          end if;
          -- fin de l'ajout
          --L_mont_docu_limi2 := nvl(L_mont_docu_limi2,0) + nvl(enr_docu.mont,0);
        end if;
        -- modif JFL en date du 07/02/2001
        -- elsif (enr_docu.date_tran < L_en_date-L_limi_3) then
      elsif (enr_docu.date_tran <
            GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_3, L_mode)) then
        if (enr_docu.type_tran = 'P') then
          L_mont_docu_limi3 := nvl(L_mont_docu_limi3, 0) +
                               nvl(enr_docu.mont_paye_ouve, 0);
        else
          -- ajout par chanthol 05-02-2001
          -- Pour que les ajustement de paiement en positif
          if (enr_docu.type_tran = 'A' and enr_docu.type_ajus = 'P' and
             sign(enr_docu.mont) = 1) then
            L_mont_docu_limi3 := nvl(L_mont_docu_limi3, 0) -
                                 nvl(enr_docu.mont, 0);
          else
            -- Pour que les ajustement de paiement en négatif
            if (enr_docu.type_tran = 'A' and enr_docu.type_ajus = 'P' and
               sign(enr_docu.mont) = -1) then
              L_mont_docu_limi3 := nvl(L_mont_docu_limi3, 0) +
                                   abs(nvl(enr_docu.mont, 0));
            else
              L_mont_docu_limi3 := nvl(L_mont_docu_limi3, 0) +
                                   nvl(enr_docu.mont, 0);
            end if;
          end if;
          -- fin de l'ajout
          --L_mont_docu_limi3 := nvl(L_mont_docu_limi3,0) + nvl(enr_docu.mont,0);
        end if;
        --
      elsif (enr_docu.date_tran > L_en_date) then
        if (enr_docu.type_tran = 'P') then
          L_mont_docu_apre := nvl(L_mont_docu_apre, 0) +
                              nvl(enr_docu.mont_paye_ouve, 0);
        else
          -- ajout par chanthol 13-02-2001
          -- Pour que les ajustement de paiement en positif
          if (enr_docu.type_tran = 'A' and enr_docu.type_ajus = 'P' and
             sign(enr_docu.mont) = 1) then
            L_mont_docu_apre := nvl(L_mont_docu_apre, 0) -
                                nvl(enr_docu.mont, 0);
          else
            -- Pour que les ajustement de paiement en négatif
            if (enr_docu.type_tran = 'A' and enr_docu.type_ajus = 'P' and
               sign(enr_docu.mont) = -1) then
              L_mont_docu_apre := nvl(L_mont_docu_apre, 0) +
                                  abs(nvl(enr_docu.mont, 0));
            else
              L_mont_docu_apre := nvl(L_mont_docu_apre, 0) +
                                  nvl(enr_docu.mont, 0);
            end if;
          end if;
        end if;
      end if;
    End loop;
    close sel_docu;
    /* Calculer les sommes payées selon les périodes */
    open sel_paie;
    Loop
      fetch sel_paie
        into enr_paie;
      exit when sel_paie%notfound;
      -- modif. JFL en date du 07/02/2001
      -- if (enr_paie.date_tran_fact between L_en_date-L_limi_1 and L_en_date) and
      if (enr_paie.date_tran_fact between
         GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_1, L_mode) and
         L_en_date) and (enr_paie.date_tran_paie <= L_en_date) then
        L_mont_paye_cour := nvl(L_mont_paye_cour, 0) +
                            nvl(enr_paie.montant, 0);
        -- modif. jfl en date du 07/02/2001
        -- elsif (enr_paie.date_tran_fact between L_en_date-L_limi_2 and L_en_date-L_limi_1) and
      elsif (enr_paie.date_tran_fact between
            GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_2, L_mode) and
            GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_1, L_mode)) and
            (enr_paie.date_tran_paie <= L_en_date) then
        L_mont_paye_limi1 := nvl(L_mont_paye_limi1, 0) +
                             nvl(enr_paie.montant, 0);
        -- modif. jfl en date du 07/02/2001
        -- elsif (enr_paie.date_tran_fact between L_en_date-L_limi_3 and L_en_date-L_limi_2) and
      elsif (enr_paie.date_tran_fact between
            GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_3, L_mode) and
            GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_2, L_mode)) and
            (enr_paie.date_tran_paie <= L_en_date) then
        L_mont_paye_limi2 := nvl(L_mont_paye_limi2, 0) +
                             nvl(enr_paie.montant, 0);
        -- modif. jfl en date du 07/02/2001
        -- elsif (enr_paie.date_tran_fact < L_en_date-L_limi_3) and
      elsif (enr_paie.date_tran_fact <
            GCC_GENERAL_2.Fonc_calc_date(L_en_date, L_limi_3, L_mode)) and
            (enr_paie.date_tran_paie <= L_en_date) then
        L_mont_paye_limi3 := nvl(L_mont_paye_limi3, 0) +
                             nvl(enr_paie.montant, 0);
      elsif (enr_paie.date_tran_paie > L_en_date) then
        L_mont_paye_apre := nvl(L_mont_paye_apre, 0) +
                            nvl(enr_paie.montant, 0);
      end if;
    End loop;
    close sel_paie;
    /* Calculer les montants dus selon les limites */
    L_tota_cour  := nvl(L_mont_docu_cour, 0) - nvl(L_mont_paye_cour, 0);
    L_tota_limi1 := nvl(L_mont_docu_limi1, 0) - nvl(L_mont_paye_limi1, 0);
    L_tota_limi2 := nvl(L_mont_docu_limi2, 0) - nvl(L_mont_paye_limi2, 0);
    L_tota_limi3 := nvl(L_mont_docu_limi3, 0) - nvl(L_mont_paye_limi3, 0);
    /* Créer la chaine de retour */
    L_chaine := 'CR:' || to_char(L_tota_cour) || ':L1:' ||
                to_char(L_tota_limi1) || ':L2:' || to_char(L_tota_limi2) ||
                ':L3:' || to_char(L_tota_limi3) || ':DA:' ||
                to_char(L_mont_docu_apre) || ':PA:' ||
                to_char(L_mont_paye_apre);
        GCC_general.list_chaine(to_char(P_no_clie)).chaine := L_chaine;
    else
       L_chaine := GCC_general.list_chaine(to_char(P_no_clie)).chaine;
    end if;

    Return(L_chaine);
  End;
  --
  Function FONC_calc_taxe_gcc_non_incl(P_NO_TRAN       NUMBER, -- Numéro de la transaction
                                       P_INSE_GCC_CLIE varchar2 -- Valide si on inserere ou pas  dans gcc_clie
                                       ) Return Number is
    --
    cursor sel_clie is -- trouve le numero du client par le no_tran
      select no_clie, date_tran
        from gcc_tran_clie
       where no_tran = P_NO_TRAN;
    --
    cursor cur_clie(p_no_clie number) is
      select no_terr from gcc_clie Where no_clie = p_no_clie;
    enr_clie cur_clie%rowtype;
    --
    L_no_taxe     gsy_taxe.no_taxe%type;
    L_taxe_exem   number := gsy_general.FONC_obte_vale_para('GCC_TAXE_EXEM');

    --
    cursor sel_taxe_terr(p_no_clie number) is
      select T.no_taxe, T.taux, T.taxe_taxa, T.ordr_calc, T.no_gl_taxe
        from gsy_taxe_terr TT, gsy_taxe T
       where TT.no_terr = enr_clie.no_terr
         and T.type_taxe = 'V'
         and TT.defa = 'O'
         -- tâche 46278 si la taxe pour le client n'est pas exempté
         and (gcc_general_3.fonc_veri_taxe_exem_clie (tt.no_taxe, P_no_clie) != 'O'
         /*and (tt.no_taxe not in (select no_taxe
                                 from gcc_taxe_clie
                                where no_clie = P_no_clie
                                  and exem_taxe = 'O')*/

              and ((L_taxe_exem is not null
                   -- tâche 46278 si la taxe pour le client n'est pas exempté
                   and gcc_general_3.fonc_veri_taxe_exem_clie (l_taxe_exem, P_no_clie) != 'O'
                   /*l_taxe_exem not in (select no_taxe
                                         from gcc_taxe_clie
                                        where no_clie = P_no_clie
                                          and exem_taxe = 'O')*/)
                   or (L_taxe_exem is null)
                   )
              )
         and T.no_taxe = TT.no_taxe
       order by T.ordr_calc;
    enr_taxe_terr sel_taxe_terr%rowtype;
    ---
    cursor sel_sum_mont is
      select sum(montant) from gcc_ecri_clie where no_tran = P_NO_TRAN;
    --
    cursor sel_no_type_taux(p_no_clie number) is
      select R.no_type_taux
        from gccv_clie C, gcc_rece R, gsy_term_paie T
       where C.no_clie = p_no_clie
         and R.no_rece(+) = C.no_rece
         and T.no_term_paie(+) = C.no_term_paie;
    cursor sel_no_devi(p_no_gl_taxe varchar2) is
      select no_devi from ggl_comp_gl where no_gl = p_no_gl_taxe;
    cursor sel_taxe(p_no_clie number) is
      select T.no_taxe, T.taux, T.taxe_taxa, T.ordr_calc, T.no_gl_taxe
        from gsy_taxe T
       where T.type_taxe = 'V'
         and T.defa_prod = 'O'
         -- tâche 46278 si la taxe pour le client n'est pas exempté
         and (gcc_general_3.fonc_veri_taxe_exem_clie (t.no_taxe, P_no_clie) != 'O'
         /*and (t.no_taxe not in (select no_taxe
                                 from gcc_taxe_clie
                                where no_clie = P_no_clie
                                  and exem_taxe = 'O')*/
              and ((L_taxe_exem is not null
                   -- tâche 46278 si la taxe pour le client n'est pas exempté
                   and gcc_general_3.fonc_veri_taxe_exem_clie (l_taxe_exem, P_no_clie) != 'O'
                   /*and
                   l_taxe_exem not in (select no_taxe
                                         from gcc_taxe_clie
                                        where no_clie = P_no_clie
                                          and exem_taxe = 'O')*/)
                   or (L_taxe_exem is null)
                   )
              )
       order by T.ordr_calc;
    enr_taxe sel_taxe%rowtype;
    --
    L_anc_ordr       gsy_taxe.ordr_calc%type;
    L_tota_taxe      number(20, 2) := 0;
    L_mont_taxe_cour number(20, 2) := 0;
    L_mont_taxe_nouv number(20, 2) := 0;
    L_mont_tran      number(20, 2) := 0;
    L_no_clie        number;
    L_gran_tota_taxe number(20, 2) := 0;
    L_no_ecri        number;
    L_taux_conv      number;
    L_no_devi        number;
    L_date_tran      date;
    L_no_type_taux   number;
    L_no_gl_taxe     varchar2(12);
  Begin
    open sel_clie; -- Trouve le numéro du client.
    fetch sel_clie
      into L_no_clie, L_date_tran;
    close sel_clie;
    --
    open sel_sum_mont; -- Calculer le total des écritures  et le met dans L_mont_tran
    fetch sel_sum_mont
      into L_mont_tran;
    close sel_sum_mont;
    --
    open sel_no_type_taux(L_no_clie);
    fetch sel_no_type_taux
      into L_no_type_taux;
    close sel_no_type_taux;
    --
    if (nvl(L_mont_tran, 0) != 0) then
      L_mont_taxe_nouv := round(nvl(L_mont_tran, 0), 2); -- Montant de la transaction
      L_mont_taxe_cour := nvl(L_mont_taxe_nouv, 0);
      -- Vérifier si il y a taxe sur territoire du client
      open cur_clie(L_no_clie);
      fetch cur_clie
        into enr_clie;
      close cur_clie;
      open sel_taxe_terr(L_no_clie);
      fetch sel_taxe_terr
        into enr_taxe_terr;
      if (sel_taxe_terr%notfound) then
        close sel_taxe_terr;
        -- Calculer la taxe avec celle dans la table GSY_TAXE.
        open sel_taxe(L_no_clie);
        fetch sel_taxe
          into enr_taxe;
        L_no_gl_taxe := enr_taxe.no_gl_taxe;
        open sel_no_devi(L_no_gl_taxe);
        fetch sel_no_devi
          into L_no_devi;
        close sel_no_devi;
        if (sel_taxe%found) then
          L_no_taxe  := enr_taxe.no_taxe;
          L_anc_ordr := enr_taxe.ordr_calc;
          Loop
            -- Maintenir à jour l'ordre de calcul et le montant courant.
            if (L_anc_ordr != enr_taxe.ordr_calc) then
              L_anc_ordr       := enr_taxe.ordr_calc;
              L_mont_taxe_cour := nvl(L_mont_taxe_nouv, 0);
            end if;
            -- Calcule du montant pour une taxe.
            L_tota_taxe      := round(nvl(L_mont_taxe_cour, 0) *
                                      (nvl(enr_taxe.taux, 0) / 100),
                                      2);
            L_gran_tota_taxe := L_gran_tota_taxe + L_tota_taxe;
            if (enr_taxe.taxe_taxa = 'O') then
              L_mont_taxe_nouv := nvl(L_mont_taxe_nouv, 0) +
                                  nvl(L_tota_taxe, 0);
            end if;
            if nvl(P_INSE_GCC_CLIE, 'N') = 'O' then
              L_taux_conv := GSY_general.FONC_obte_taux_conv(L_no_devi,
                                                             GSY_general.FONC_obte_devi_cie,
                                                             L_no_type_taux,
                                                             L_date_tran);
              L_no_ecri   := gcc_general.FONC_generer_noecri_gcc;
              insert into gcc_ecri_clie
                (no_ecri,
                 montant,
                 no_gl,
                 no_tran,
                 no_hier_orga,
                 no_devi,
                 taux_conv,
                 mont_devi)
              values
                (L_no_ecri,
                 nvl(L_tota_taxe, 0),
                 enr_taxe.no_gl_taxe,
                 P_no_tran,
                 0,
                 L_no_devi,
                 L_taux_conv,
                 (nvl(L_tota_taxe, 1) * L_taux_conv));
            end if;
            fetch sel_taxe
              into enr_taxe;
            exit when sel_taxe%notfound;
          End loop;
        end if;
        close sel_taxe;
      else
        L_no_taxe  := enr_taxe_terr.no_taxe;
        L_anc_ordr := enr_taxe_terr.ordr_calc;
        Loop
          -- Maintenir à jour l'ordre de calcul et le montant courant.
          if (L_anc_ordr != enr_taxe_terr.ordr_calc) then
            L_anc_ordr       := enr_taxe_terr.ordr_calc;
            L_mont_taxe_cour := nvl(L_mont_taxe_nouv, 0);
          end if;
          -- Calcule du montant pour une taxe.
          L_tota_taxe := round(nvl(L_mont_taxe_cour, 0) *
                               (nvl(enr_taxe_terr.taux, 0) / 100),
                               2);
          if (enr_taxe_terr.taxe_taxa = 'O') then
            L_mont_taxe_nouv := nvl(L_mont_taxe_nouv, 0) +
                                nvl(L_tota_taxe, 0);
          end if;
          -- Créer écriture de la taxe
          --
          if nvl(P_INSE_GCC_CLIE, 'N') = 'O' then
            L_no_ecri := gcc_general.FONC_generer_noecri_gcc;
            insert into gcc_ecri_clie
              (no_ecri,
               montant,
               no_gl,
               no_tran,
               no_hier_orga,
               no_devi,
               taux_conv,
               mont_devi)
            values
              (L_no_ecri,
               nvl(L_tota_taxe, 0),
               enr_taxe.no_gl_taxe,
               P_no_tran,
               0,
               L_no_devi,
               L_taux_conv,
               (nvl(L_tota_taxe, 1) * L_taux_conv));
          end if;
          fetch sel_taxe_terr
            into enr_taxe_terr;
          exit when sel_taxe_terr%notfound;
        End loop;
        close sel_taxe_terr;
      end if;
    end if;
    Return(nvl(L_gran_tota_taxe, 0));
  End FONC_calc_taxe_gcc_non_incl;
  Procedure PROC_init_tablEncais is
    /* initialisation des tables PL/SQL pour calcul des totaux */
  Begin
    For i in 1 .. 999 LOOP
      GCC_general.nbre_tab(i) := 0;
      GCC_general.mont_tab(i) := 0;
    END LOOP;
  End PROC_init_tablEncais;
  Procedure PROC_insert_tablencais(P_no_type_paie number, P_montant number) is
  Begin
    if (nvl(P_montant, 0) != 0) then
      GCC_general.nbre_tab(P_no_type_paie) := GCC_general.nbre_tab(P_no_type_paie) + 1;
    end if;
    GCC_general.mont_tab(P_no_type_paie) := GCC_general.mont_tab(P_no_type_paie) +
                                            P_montant;
  End PROC_insert_tablencais;
  Procedure PROC_extraire_tablencais(P_no_type_paie IN number,
                                     P_montant      OUT number,
                                     P_nombre       OUT number) is
  Begin
    P_montant := GCC_general.mont_tab(P_no_type_paie);
    P_nombre  := GCC_general.nbre_tab(P_no_type_paie);
  End PROC_extraire_tablencais;
  Procedure PROC_obte_sold_clie(P_no_clie   IN number, -- No du client
                                P_sold_clie OUT number -- Solde du client
                                ) is
    /* ***************************************** */
    /* Obtenir le solde du compte d'un client    */
    /* en calculant les comptes recevables (GCC) */
    /* et les transactions des ventes (GCO)      */
    /* ***************************************** */
    /* Déclaration de variables */
    L_montant             number; -- Résultat des fetch (montants)
    L_mont_calc           number; -- Montant à additionner au solde
    L_mont_max            number; -- Le plus haut montant à considérer
    L_sold_clie           number; -- Solde du client à retourner
    L_no_docu             number; -- Numéro du document (Facture, retour)
    L_cate_item           varchar2(1); -- Catégorie de l'item (F)acture, (R)etour
    L_taxe_incl           varchar2(1); -- Indique si taxe incluse ou non
    L_form_masq_date_orac varchar2(20); -- Format masque de la date
    L_chaine_mont_du      Varchar2(2000);
    L_mont_cour           number;
    L_mont_limi1          number;
    L_mont_limi2          number;
    L_mont_limi3          number;
    L_mont_du_apre        number;
    L_mont_paye_apre      number;
    L_mont_paye_fact      number; -- Montant Total payé sur la facture
    L_mont_trop_paye      number; -- Montant trop payé sur la facture
    L_indi_mont_cc        varchar2(1); -- Indicateur si le trop payé a été envoyé au CC
    /* Extraire les factures */
    Cursor sel_fact is
      Select F.no_fact,
             F.taxe_incl,
             F.mont_trop_paye,
             F.indi_mont_cc,
             sum(nvl(tp.mont_type, 0)) mont_paye
        from gco_fact F, gsy_cont_lot GCL, gco_type_paie TP
       where F.no_clie = P_no_clie
         and F.no_lot = GCL.no_lot
         and F.no_fact = TP.no_fact(+)
         and GCL.etat_lot = 'O'
         and GCL.type_lot = 'F'
         and GCL.modu_prop = 'GCO'
       group by F.no_fact, F.taxe_incl, F.mont_trop_paye, F.indi_mont_cc;
    /* Extraire les retours */
    Cursor sel_reto is
      Select R.no_reto, F.taxe_incl
        from gco_reto R, gco_fact F, gsy_cont_lot GCL
       where R.no_fact = F.no_fact
         and R.no_clie = P_no_clie
         and R.no_lot = GCL.no_lot
         and GCL.etat_lot = 'O'
         and GCL.type_lot = 'R'
         and GCL.modu_prop = 'GCO';
    /* Extraire les notes de débits et crédits */
    Cursor sel_note is
      Select sum(nvl(N.montant, 0)) mont_note
        from gco_note_dt_ct N, gsy_cont_lot GCL
       where N.no_clie = P_no_clie
         and N.no_lot = GCL.no_lot
         and GCL.etat_lot = 'O'
         and GCL.type_lot = 'R'
         and GCL.modu_prop = 'GCO';
    /* Extraire les montants des items facturés et retournés */
    Cursor sel_item is
      Select sum(nvl(I.quan, 0) * nvl(I.prix_vent, 0))
        from gco_item I
       where I.no_cate = L_no_docu
         and I.cate_item = L_cate_item;
    /* Extraire les montants des items commandés et non facturés ou partiellement facturés*/
    Cursor sel_part is
      Select nvl(sum(decode(I.cate_item,
                            'C',
                            I.quan * I.prix_vent,
                            'F',
                            -I.quan * I.prix_vent)),
                 0) total
        from gco_item I, gco_comm C
       where C.no_clie = P_no_clie
         and ((I.no_cate = C.no_comm and I.cate_item = 'C') or
             (I.no_comm = C.no_comm and I.cate_item = 'F'))
       Group by I.no_item
      having nvl(sum(decode(I.cate_item, 'C', I.quan * I.prix_vent, 'F', -I.quan * I.prix_vent)), 0) != 0;
    /* Extraire les montants des taxes sur les items facturés et retournés */
    Cursor sel_taxe is
      Select sum(nvl(T.mont_taxe, 0))
        from gco_taxe_item T
       where T.no_fact = L_no_docu
         and T.type_item = L_cate_item;
  Begin
    /* *********************************** */
    /* Obtenir le format masque de la date */
    /* *********************************** */
    if (GCC_general.LP_form_masq_date_orac is null) then
      GCC_general.LP_form_masq_date_orac := GSY_general.FONC_form_masq_date_orac;
    end if;
    L_form_masq_date_orac := GCC_general.LP_form_masq_date_orac;
    /* ************************************************************* */
    /* Calculer le solde du client dans les comptes recevables (GCC) */
    /* ************************************************************* */
    L_chaine_mont_du := GCC_general.FONC_age_cpte_gcc(P_no_clie,
                                                      to_char(trunc(sysdate),
                                                              L_form_masq_date_orac));
    GSY_general.PROC_obte_age_cpte(L_chaine_mont_du,
                                   L_mont_cour,
                                   L_mont_limi1,
                                   L_mont_limi2,
                                   L_mont_limi3,
                                   L_mont_du_apre,
                                   L_mont_paye_apre);
    L_sold_clie := nvl(L_sold_clie, 0) + nvl(L_mont_cour, 0) +
                   nvl(L_mont_limi1, 0) + nvl(L_mont_limi2, 0) +
                   nvl(L_mont_limi3, 0) + nvl(L_mont_du_apre, 0) -
                   nvl(L_mont_paye_apre, 0);
    /* ************************************************* */
    /* Calculer le solde du client dans les ventes (GCO) */
    /* ************************************************* */
    /* Calculer le montant total des factures du lot */
    L_cate_item := 'F';
    open sel_fact;
    Loop
      fetch sel_fact
        into L_no_docu, L_taxe_incl, L_mont_trop_paye, L_indi_mont_cc, L_mont_paye_fact;
      exit when sel_fact%notfound;
      open sel_item;
      fetch sel_item
        into L_montant;
      close sel_item;
      /* Affecter le solde du client à retourner du total des items facturés*/
      L_sold_clie := nvl(L_sold_clie, 0) + nvl(L_montant, 0);
      if (L_taxe_incl = 'N') then
        open sel_taxe;
        fetch sel_taxe
          into L_montant;
        close sel_taxe;
        /* Affecter le solde du client à retourner du total des taxes */
        L_sold_clie := nvl(L_sold_clie, 0) + nvl(L_montant, 0);
        L_montant   := 0;
      end if;
      /* Tenir compte du paiement sur la facture de point de vente */
      if (L_indi_mont_cc = 'O') then
        L_sold_clie := nvl(L_sold_clie, 0) - nvl(L_mont_paye_fact, 0);
      else
        L_sold_clie := nvl(L_sold_clie, 0) + nvl(L_mont_trop_paye, 0) -
                       nvl(L_mont_paye_fact, 0);
      end if;
    End loop;
    close sel_fact;
    /* Affecter le solde du client à retourner du total des items commandés non facturés ou partiellement*/
    open sel_part;
    fetch sel_part
      into L_montant;
    close sel_part;
    L_sold_clie := nvl(L_sold_clie, 0) + nvl(L_montant, 0);
    L_montant   := 0;
    /* Calculer le montant total des retours du lot */
    L_cate_item := 'R';
    open sel_reto;
    Loop
      fetch sel_reto
        into L_no_docu, L_taxe_incl;
      exit when sel_reto%notfound;
      open sel_item;
      fetch sel_item
        into L_montant;
      close sel_item;
      /* Affecter le solde du client à retourner du total des items */
      L_sold_clie := nvl(L_sold_clie, 0) + nvl(L_montant, 0);
      if (L_taxe_incl = 'N') then
        open sel_taxe;
        fetch sel_taxe
          into L_montant;
        close sel_taxe;
        /* Affecter le solde du client à retourner du total des taxes */
        L_sold_clie := nvl(L_sold_clie, 0) + nvl(L_montant, 0);
        L_montant   := 0;
      end if;
    End loop;
    close sel_reto;
    /* Calculer le montant total des notes de DT/CT du lot */
    open sel_note;
    fetch sel_note
      into L_montant;
    close sel_note;
    /* Affecter le solde du client à retourner */
    L_sold_clie := nvl(L_sold_clie, 0) + nvl(L_montant, 0);
    L_montant   := 0;
    /* Affecter le solde total du client à retourner */
    P_sold_clie := nvl(L_sold_clie, 0);
  End PROC_obte_sold_clie;
  -- cette procedure a éte modifiée par kader le 19/06/02
  Procedure PROC_ajus_sold_gcc(P_no_clie_debu   IN number,
                               P_no_clie_dern   IN number,
                               P_sold_debu      IN number,
                               P_sold_dern      IN number,
                               P_no_type_paie   IN number,
                               P_no_rece        IN number,
                               P_no_gl_ajus     IN Varchar2,
                               P_refe           IN Varchar2,
                               P_date_tran      IN date,
                               P_no_depo        IN number,
                               P_no_hier_orga   IN number default 0,
                               P_nbre_clie_trai OUT number) is
    L_limi_1_cc varchar2(10) := GSY_general.FONC_obte_vale_para('LIMI_1_CC');
    L_limi_2_cc varchar2(10) := GSY_general.FONC_obte_vale_para('LIMI_2_CC');
    L_limi_3_cc varchar2(10) := GSY_general.FONC_obte_vale_para('LIMI_3_CC');
    L_no_clie   gcc_tran_clie.no_clie%type := Null;
    --      L_mont_du_tota        gcc_tran_vent.mont%type:= Null;
    L_mont_avance         gcc_tran_clie.montant%type := Null;
    L_chain_reto          Varchar2(2000) := Null;
    L_desc_lot            varchar2(2000) := Null;
    L_mont_cour           number;
    L_mont_limi1          number;
    L_mont_limi2          number;
    L_mont_limi3          number;
    L_sold_clie           number; -- Solde du client en traitement
    L_form_masq_date_orac varchar2(20); -- Format masque de la date
    L_no_lot_ajus         gsy_cont_lot.no_lot%type := null; -- No de lot d'ajustement
    L_no_tran_ajus        gcc_tran_clie.no_tran%type := null; -- No de transaction d'ajustement
    L_no_ecri_ajus        gcc_ecri_clie.no_ecri%type := null; -- No de l'écriture de la transaction d'ajustement
    L_no_lot_paie         gsy_cont_lot.no_lot%type := null; -- No de lot de paiement
    L_no_tran_paie        gcc_tran_clie.no_tran%type := null; -- No de transaction de paiement
    L_no_ecri_paie        gcc_ecri_clie.no_ecri%type := null; -- No de l'écriture de la transaction de paiement
    --
    Cursor sel_clie is
      Select C.no_clie, R.no_devi, R.no_rece
        from gccv_clie C, gcc_rece R
       where ((C.no_clie between P_no_clie_debu and P_no_clie_dern) or
             (P_no_clie_debu is null and P_no_clie_dern is null))
         and C.no_rece = P_no_rece
         and C.no_rece = R.no_rece(+);
    --
    --     enr_clie sel_clie%rowtype;
    --
    Cursor sel_avan is
      Select T.no_tran,
             nvl(T.mont_paye_ouve, 0) - nvl(T.mont_paye_repo, 0) MONT_BALA
        from gcc_tran_clie T
       where T.no_clie = L_no_clie
         and T.type_tran = 'P'
         and abs(nvl(T.mont_paye_repo, 0)) < abs(nvl(T.mont_paye_ouve, 0))
         for update of mont_paye_repo;
    --
    enr_avan sel_avan%rowtype;
    --
    Cursor sel_tran_vent is
      Select V.no_tran,
             --nvl(V.mont, 0) - nvl(V.mont_paye_ouve, 0) MONT_BALA,
                 decode(type_ajus,'P',(nvl(V.mont, 0) - nvl(V.mont_paye_ouve, 0))*-1,(nvl(V.mont, 0) - nvl(V.mont_paye_ouve, 0))  ) MONT_BALA,
             V.no_rece
        from gcc_tran_clie T, gcc_tran_vent V
       where V.no_clie = L_no_clie
         and T.type_tran != 'P'
         and abs(nvl(V.mont_paye_ouve, 0)) < abs(nvl(V.mont, 0))
         and V.no_tran = T.no_tran
         for update of V.mont_paye_ouve;
    --
    enr_tran_vent sel_tran_vent%rowtype;
    --
    Cursor sel_tran is
      Select sum(V.mont_paye_ouve) mont,
             (sum(V.mont_paye_ouve) - nvl(t.mont_paye_ouve, 0)) mont_bala
        from gcc_tran_clie T, gcc_tran_vent V
       where T.no_tran = enr_tran_vent.no_tran
         and T.no_tran = V.no_tran
       group by t.no_tran, t.mont_paye_ouve;
    --
    enr_tran sel_tran%rowtype;
    --
    cursor sel_vent_exis(P_no_clie gcc_tran_vent.no_clie%type, P_no_rece gcc_tran_vent.no_rece%type) is
      select no_tran, no_clie, no_rece
        from gcc_tran_vent
       where no_tran = L_no_tran_ajus
         and no_clie = P_no_clie
         and no_rece = P_no_rece
         for update;
    --
    enr_vent_exis sel_vent_exis%rowtype;
    --
    Cursor sel_type_paie is
      Select no_gl, no_devi
        from gsy_type_paie
       where no_type_paie = P_no_type_paie;
    --
    enr_type sel_type_paie%rowtype;
    --
    Cursor sel_avance is
      select sum(nvl(mont_paye_ouve, 0) - nvl(mont_paye_repo, 0)) mont
        from gcc_tran_clie
       where type_tran = 'P'
         and no_clie = L_no_clie;
    --
    Cursor sel_mont_term is
      select mont_du
        from gcc_mont_term
       where no_clie = L_no_clie
         for update;
    L_mont_du number(12, 2);
    --
    text varchar2(600) := Null;
  Begin
    /* Obtenir le format masque de la date selon le paramètre */
    if (GCC_general.LP_form_masq_date_orac is null) then
      GCC_general.LP_form_masq_date_orac := GSY_general.FONC_form_masq_date_orac;
    end if;
    L_form_masq_date_orac := GCC_general.LP_form_masq_date_orac;
    /* Obtenir le no de gl du type de paiement */
    open sel_type_paie;
    fetch sel_type_paie
      into enr_type;
    close sel_type_paie;
    /* Traiter chaque client individuellement */
    P_nbre_clie_trai := 0;
    For list_clie in sel_clie Loop
      /* Obtenir le solde du client */
      L_no_clie     := list_clie.no_clie;
      L_mont_avance := null;
      open sel_avance;
      fetch sel_avance
        into L_mont_avance;
      close sel_avance;
      --       L_mont_du_tota := nvl(L_mont_du_tota,0) + nvl(L_mont_avance,0);
      L_chain_reto := Null;
      gcc_general_2.Proc_remp_tabl_tranc_date(list_clie.no_clie,
                                              to_date('01-JAN-3000','DD-MON-RRRR'),--trunc(sysdate),
                                              L_limi_1_cc || ',' ||
                                              L_limi_2_cc || ',' ||
                                              L_limi_3_cc,
                                              'N',
                                              L_chain_reto);
      L_mont_cour  := to_number(substr(L_chain_reto,
                                       1,
                                       (instr(L_chain_reto, ',') - 1)));
      L_chain_reto := substr(L_chain_reto, instr(L_chain_reto, ',') + 1);
      L_mont_limi1 := to_number(substr(L_chain_reto,
                                       1,
                                       (instr(L_chain_reto, ',') - 1)));
      L_chain_reto := substr(L_chain_reto, instr(L_chain_reto, ',') + 1);
      L_mont_limi2 := to_number(substr(L_chain_reto,
                                       1,
                                       (instr(L_chain_reto, ',') - 1)));
      L_chain_reto := substr(L_chain_reto, instr(L_chain_reto, ',') + 1);
      L_mont_limi3 := to_number(substr(L_chain_reto, 1));
      -- calcule du solde client
      L_sold_clie := nvl(L_mont_cour, 0) + nvl(L_mont_limi1, 0) +
                     nvl(L_mont_limi2, 0) + nvl(L_mont_limi3, 0) ;
                   --  + nvl(L_mont_avance, 0);
                   -- Rémé 08-02-2007, l'avance est déja calculée dans l_chain_reto
      /* Ajuster le client si le solde est entre le solde de début et de fin */
      if (nvl(L_sold_clie, 0) between nvl(P_sold_debu, 0) and
         nvl(P_sold_dern, 0)) and (nvl(L_sold_clie, 0) != 0) then
        P_nbre_clie_trai := P_nbre_clie_trai + 1;
        /* Vérifier les devises afin quelles soient pareils */
        if (enr_type.no_devi != list_clie.no_devi) then
          /* Raise_application_error(21000,'Le type de paiement doit être de la même'
          ||' devise que celle du compte recevable du client.');  F.L. 21 JAN 2000*/
          GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20109',
                                                                  'GCC');
          raise_application_error(-20109,
                                  GSY_general_2.FONC_rech_mess('20109',
                                                               'GCC'));
        end if;
        /* AJUSTEMENT */
        /* Insérer le lot d'ajustement du solde */
        if (L_no_lot_ajus is null) then
          L_desc_lot    := GSY_general_2.FONC_rech_mess('3173', 'GCC');
          L_no_lot_ajus := Gsy_general.FONC_lot_quotidien('A',
                                                          'C',
                                                          'GCC',
                                                          'GCC',
                                                          L_desc_lot || ' ' ||
                                                          substr(to_char(P_date_tran,
                                                                         L_form_masq_date_orac),
                                                                 1,
                                                                 10),
                                                          NULL,
                                                          'O');
        end if;
        /* Insérer la transaction (ajustement) */
        L_no_tran_ajus := GCC_general.FONC_generer_notran_gcc;
        Insert into gcc_tran_clie
          (no_tran,
           date_tran,
           montant,
           no_lot,
           no_clie,
           type_tran,
           refe,
           mont_paye_ouve,
           no_devi,
           taux_conv,
           type_ajus)
        values
          (L_no_tran_ajus,
           P_date_tran,
           - (L_sold_clie),
           L_no_lot_ajus,
           list_clie.no_clie,
           'A',
           P_refe,
           - (L_sold_clie),
           list_clie.no_devi,
           1,
           'F');

        /* Insérer l'écriture (ajustement) */
        L_no_ecri_ajus := GCC_general.FONC_generer_noecri_gcc;
        Insert into gcc_ecri_clie
          (no_ecri,
           no_tran,
           montant,
           no_gl,
           no_devi,
           taux_conv,
           no_hier_orga)
        values
          (L_no_ecri_ajus,
           L_no_tran_ajus,
           L_sold_clie,
           P_no_gl_ajus,
           list_clie.no_devi,
           1,
           P_no_hier_orga);
        /* PAIEMENT */
        /* Insérer le lot de paiement */
        if (L_no_lot_paie is null) then
          L_desc_lot    := GSY_general_2.FONC_rech_mess('3172', 'GCC');
          L_no_lot_paie := Gsy_general.FONC_lot_quotidien('P',
                                                          'C',
                                                          'GCC',
                                                          'GCC',
                                                          L_desc_lot || ' ' ||
                                                          substr(to_char(P_date_tran,
                                                                         L_form_masq_date_orac),
                                                                 1,
                                                                 10),
                                                          NULL,
                                                          'O');
        end if;
        /* Insérer la transaction (paiement) */
        L_no_tran_paie := GCC_general.FONC_generer_notran_gcc;
        Insert into gcc_tran_clie
          (no_tran,
           date_tran,
           montant,
           no_lot,
           no_clie,
           type_tran,
           refe,
           no_devi,
           taux_conv,
           no_depo,
           type_tran_paie)
        values
          (L_no_tran_paie,
           P_date_tran,
           0,
           L_no_lot_paie,
           list_clie.no_clie,
           'P',
           P_refe,
           list_clie.no_devi,
           1,
           P_no_depo,
           'P');
        /* Insérer l'écriture (paiement) */
        L_no_ecri_paie := GCC_general.FONC_generer_noecri_gcc;
        Insert into gcc_ecri_clie
          (no_ecri,
           no_tran,
           montant,
           no_gl,
           no_devi,
           taux_conv,
           no_type_paie,
           no_hier_orga)
        values
          (L_no_ecri_paie,
           L_no_tran_paie,
           0,
           enr_type.no_gl,
           enr_type.no_devi,
           1,
           P_no_type_paie,
           0);
        /* APPLIQUER LES PAIEMENTS D'AVANCE */
        /* Insérer la distribution */
        open sel_avan;
        Loop
          enr_avan := null;
          fetch sel_avan
            into enr_avan;
          exit when sel_avan%notfound;
          if (nvl(enr_avan.mont_bala, 0) != 0) then
            Update gcc_tran_clie
               set mont_paye_repo = nvl(mont_paye_ouve, 0)
             where current of sel_avan;
            /* Insérer la distribution */
            /*  ajout par Anna K. date : 15-03-2000 */
            GCC_general.PROC_mise_a_jour_dist(L_no_tran_paie,
                                              enr_avan.no_tran,
                                              nvl(enr_avan.mont_bala, 0));
            GCC_general.PROC_mise_a_jour_dist_vent(L_no_tran_paie,
                                                   enr_avan.no_tran,
                                                   nvl(enr_avan.mont_bala,
                                                       0),
                                                   list_clie.no_rece,
                                                   list_clie.no_clie);
            GCC_general.PROC_mise_a_jour_dist(L_no_tran_paie,
                                              L_no_tran_ajus,
                                              -nvl(enr_avan.mont_bala, 0));
            GCC_general.PROC_mise_a_jour_dist_vent(L_no_tran_paie,
                                                   L_no_tran_ajus,
                                                   -nvl(enr_avan.mont_bala,
                                                        0),
                                                   list_clie.no_rece,
                                                   list_clie.no_clie);
            open sel_vent_exis(list_clie.no_clie, list_clie.no_rece);
            enr_vent_exis := null;
            fetch sel_vent_exis
              into enr_vent_exis;
            if sel_vent_exis%notfound then
              Insert into gcc_tran_vent
                (no_tran, mont, no_clie, no_rece, mont_paye_ouve)
              values
                (L_no_tran_ajus,
                 - (nvl(enr_avan.mont_bala, 0)),
                 list_clie.no_clie,
                 list_clie.no_rece,
                 - (nvl(enr_avan.mont_bala, 0)));
            else
              update gcc_tran_vent
                 set mont           = nvl(mont, 0) -
                                      (nvl(enr_avan.mont_bala, 0)),
                     mont_paye_ouve = nvl(mont_paye_ouve, 0) -
                                      (nvl(enr_avan.mont_bala, 0))
               where current of sel_vent_exis;
            end if;
            close sel_vent_exis;
          end if;
        End loop;
        close sel_avan;
        open sel_tran_vent;
        Loop
          enr_tran_vent := null;
          fetch sel_tran_vent
            into enr_tran_vent;
          exit when sel_tran_vent%notfound;
          if (nvl(enr_tran_vent.mont_bala, 0) != 0) then
            Update gcc_tran_vent
               set mont_paye_ouve = nvl(mont, 0)
             where current of sel_tran_vent;
          end if;
          open sel_tran;
          Loop
            enr_tran := null;
            fetch sel_tran
              into enr_tran;
            exit when sel_tran%notfound;
            if (nvl(enr_tran_vent.mont_bala, 0) != 0) then
              Update gcc_tran_clie
                 set mont_paye_ouve = nvl(enr_tran.mont, 0)
               where no_tran = enr_tran_vent.no_tran;
              /* Insérer la distribution */
             GCC_general.PROC_mise_a_jour_dist(L_no_tran_paie,
                                                enr_tran_vent.no_tran,
                                                nvl(enr_tran.mont_bala, 0));

             GCC_general.PROC_mise_a_jour_dist_vent(L_no_tran_paie,
                                                 enr_tran_vent.no_tran,
                                                 nvl(enr_tran.mont_bala,
                                                     0),
                                                 enr_tran_vent.no_rece,
                                                 list_clie.no_clie);

              GCC_general.PROC_mise_a_jour_dist(L_no_tran_paie,
                                                L_no_tran_ajus,
                                                - (nvl(enr_tran.mont_bala, 0)));

              GCC_general.PROC_mise_a_jour_dist_vent(L_no_tran_paie,
                                                 L_no_tran_ajus,
                                                 - (nvl(enr_tran.mont_bala,
                                                       0)),
                                                 enr_tran_vent.no_rece,
                                                 list_clie.no_clie);
            end if;
          End loop;
          --
          open sel_vent_exis(list_clie.no_clie, enr_tran_vent.no_rece);
          fetch sel_vent_exis
            into enr_vent_exis;
          if sel_vent_exis%notfound then
            Insert into gcc_tran_vent
              (no_tran, mont, no_clie, no_rece, mont_paye_ouve)
            values
              (L_no_tran_ajus,
               - (nvl(enr_tran_vent.mont_bala, 0)),
               list_clie.no_clie,
               enr_tran_vent.no_rece,
               - (nvl(enr_tran_vent.mont_bala, 0)));
          else
            update gcc_tran_vent
               set mont           = nvl(mont, 0) -
                                    (nvl(enr_tran_vent.mont_bala, 0)),
                   mont_paye_ouve = nvl(mont_paye_ouve, 0) -
                                    (nvl(enr_tran_vent.mont_bala, 0))
             where current of sel_vent_exis;
          end if;
          close sel_vent_exis;
          close sel_tran;
        End loop;
        close sel_tran_vent;
        /* updater les montants à terme  */
        for L_mont_du in sel_mont_term Loop
          Update gcc_mont_term
             set mont_paye_ouve = mont_du,
                 date_paie_fina = nvl(P_date_tran, trunc(sysdate))
           where mont_du = L_mont_du.mont_du;
        end loop;
      end if;
    End loop;
    commit;
  End PROC_ajus_sold_gcc;
  --
  Procedure PROC_Mise_a_jour_dist(P_no_tran_paie IN Number,
                                  P_no_tran_fact IN Number,
                                  P_mont_paye    IN Number) IS
    /* Distribuer les paiements sur les transactions */
    Cursor sel_dist is
      select 'x'
        from gcc_dist_paie
       where no_tran_paie = P_no_tran_paie
         and no_tran_fact = P_no_tran_fact;
    L_bidon varchar2(1);
  Begin
  gsy_outils.PROC_TRAC('NANCY GCC_DIST_PAIE','P_no_tran_paie : '||P_no_tran_paie);
    gsy_outils.PROC_TRAC('NANCY GCC_DIST_PAIE','P_no_tran_fact : '||P_no_tran_fact);
      gsy_outils.PROC_TRAC('NANCY GCC_DIST_PAIE','P_mont_paye : '||P_mont_paye);
    /* Appliquer les paiements */
    open sel_dist;
    fetch sel_dist
      into L_bidon;
    if (sel_dist%FOUND) then
      gsy_outils.PROC_TRAC('NANCY GCC_DIST_PAIE','trouve ');
      if (nvl(P_mont_paye, 0) != 0) then
        Update gcc_dist_paie
        /* rem par cs 30-05-2002 cause des problemes quand on redistribue les montants de paiement
                                 set montant =nvl(montant,0) + nvl(P_mont_paye,0)
                              */
           set montant = nvl(P_mont_paye, 0)
         where no_tran_paie = P_no_tran_paie
           and no_tran_fact = P_no_tran_fact;
      else
        Delete from gcc_dist_paie
         where no_tran_paie = P_no_tran_paie
           and no_tran_fact = P_no_tran_fact;
      end if;
    else
      gsy_outils.PROC_TRAC('NANCY GCC_DIST_PAIE','trouve PAS');
      if (nvl(P_mont_paye, 0) != 0) then
        gsy_outils.PROC_TRAC('NANCY GCC_DIST_PAIE','Avant Insert');
        Insert into gcc_dist_paie
          (no_tran_paie, no_tran_fact, montant)
        values
          (P_no_tran_paie, P_no_tran_fact, nvl(P_mont_paye, 0));
          gsy_outils.PROC_TRAC('NANCY GCC_DIST_PAIE','APRÈS Insert');          
      end if;
    end if;
    close sel_dist;
    
    --*** Pour trapper l'erreur chez Pyradia (Eric 19-01-1998) ***
       Exception
          When others then
            raise_application_error(-20005,'NANCY : '||SQLERRM);
      /*      --   raise_application_error(-20109,'ERREUR lors de la mise à jour des distributions.'); f.l. 21 jan 2000
                 raise_application_error(-20110,GSY_general_2.FONC_rech_mess('20110','GCC'));*/
  End PROC_mise_a_jour_dist;
  Procedure PROC_Mise_a_jour_dist_vent(P_no_tran_paie IN Number,
                                       P_no_tran_fact IN Number,
                                       P_mont_paye    IN Number,
                                       P_no_rece      IN Number,
                                       P_no_clie      IN Number) IS
    /* Distribuer les paiements sur les transactions */
    Cursor sel_dist_vent is
      select 'x'
        from gcc_dist_paie_vent
       where no_tran_paie = P_no_tran_paie
         and no_tran_fact = P_no_tran_fact
         and no_rece = P_no_rece;
    L_bidon_2 varchar2(1);
  Begin
    /* ajout par Anna K. date : 14-03-2000 */
    open sel_dist_vent;
    fetch sel_dist_vent
      into L_bidon_2;
    if (sel_dist_vent%FOUND) then
      if (nvl(P_mont_paye, 0) != 0) then
        Update gcc_dist_paie_vent
           set montant = nvl(montant, 0) + nvl(P_mont_paye, 0)
         where no_tran_paie = P_no_tran_paie
           and no_tran_fact = P_no_tran_fact
           and no_rece = P_no_rece
           and no_clie = P_no_clie;
      else
        Delete from gcc_dist_paie_vent
         where no_tran_paie = P_no_tran_paie
           and no_tran_fact = P_no_tran_fact
           and no_rece = P_no_rece
           and no_clie = P_no_clie;
      end if;
    else
      if (nvl(P_mont_paye, 0) != 0) then
        Insert into gcc_dist_paie_vent
          (no_tran_paie, no_tran_fact, montant, no_rece, no_clie)
        values
          (P_no_tran_paie,
           P_no_tran_fact,
           nvl(P_mont_paye, 0),
           P_no_rece,
           P_no_clie);
      end if;
    end if;
    close sel_dist_vent;
    /* fin d'ajout par Anna K. date : 14-03-2000*/
    /*
    *** Pour trapper l'erreur chez Pyradia (Eric 19-01-1998) ***
       Exception
          When others then
      /*      --   raise_application_error(-20109,'ERREUR lors de la mise à jour des distributions.'); f.l. 21 jan 2000
                 raise_application_error(-20110,GSY_general_2.FONC_rech_mess('20110','GCC'));*/
  End PROC_mise_a_jour_dist_vent;
  Procedure PROC_obte_info_clie(P_no_clie  IN Number, -- No du client
                                P_pren_nom OUT Varchar2, -- Prénom et nom du client
                                P_vali_no  IN Varchar2 -- Valider le no du client
                                ) is
    Cursor sel_info is
      Select ltrim(pren || ' ' || nom) PREN_NOM
        from gccv_clie
       where no_clie = P_no_clie;
  Begin
    if (P_no_clie is not null) then
      open sel_info;
      fetch sel_info
        into P_pren_nom;
      if (sel_info%notfound) then
        close sel_info;
        /*            raise_application_error(-20102,'Numéro de client inexistant.');  f.l. 21 jan 2000*/
        GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20111',
                                                                'GCC');
        raise_application_error(-20111,
                                GSY_general_2.FONC_rech_mess('20111', 'GCC'));
      end if;
      close sel_info;
    else
      P_pren_nom := null;
      if (P_vali_no is null) then
        /*       raise_application_error(-20103,'Numéro de client obligatoire.');  F.L. 21 JAN 2000*/
        GSY_GENERAL.LP_mess_ora := GSY_general_2.FONC_rech_mess('20112',
                                                                'GCC');
        raise_application_error(-20112,
                                GSY_general_2.FONC_rech_mess('20112', 'GCC'));
      end if;
    end if;
  End PROC_obte_info_clie;
  Function FONC_generer_noclieprodgar_gcc RETURN number as
    L_no_clie_prod_gara_gcc gcc_clie_prod_gara.no_clie_prod_gara%TYPE;
    Cursor sel_clie_prod_gara is
      Select 'x'
        from gcc_clie_prod_gara GCPG
       where GCPG.no_clie_prod_gara = L_no_clie_prod_gara_gcc;
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_CLIE_PROD_GARA dans la table GCC_CLIE_PROD_GARA */
    LOOP
      select gccs_noclieprodgara.nextval
        into L_no_clie_prod_gara_gcc
        from dual;
      if (L_tampon = L_no_clie_prod_gara_gcc) then
        if (sel_clie_prod_gara%ISOPEN) then
          close sel_clie_prod_gara;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := L_no_clie_prod_gara_gcc;
      end if;
      open sel_clie_prod_gara;
      fetch sel_clie_prod_gara
        into L_bidon;
      exit when sel_clie_prod_gara%NOTFOUND;
      close sel_clie_prod_gara;
    END LOOP;
    if (sel_clie_prod_gara%ISOPEN) then
      close sel_clie_prod_gara;
    end if;
    Return(L_no_clie_prod_gara_gcc);
  Exception
    when sequence_limite then
      /*     raise_application_error(-20204,'IMPOSSIBLE de générer la séquence - '
      ||'Contacter votre vendeur.');   F.L. 21 JAN 2000*/
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_clie_prod_gara%ISOPEN) then
        close sel_clie_prod_gara;
      end if;
      /*      raise_application_error(-20205,'ERREUR dans la FONC_generer_noclie_gcc - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      raise_application_error(-20103,
                              GSY_general_2.FONC_rech_mess('20103', 'GCC'));
  End FONC_generer_noclieprodgar_gcc;
  Function FONC_generer_noclieprod_gcc RETURN number as
    L_no_clie_prod_gcc gcc_clie_prod.no_clie_prod%TYPE;
    Cursor sel_clie_prod is
      Select 'x'
        from gcc_clie_prod GCP
       where GCP.no_clie_prod = L_no_clie_prod_gcc;
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_CLIE dans la table GCC_CLIE */
    LOOP
      select gccs_noclieprod.nextval into L_no_clie_prod_gcc from dual;
      if (L_tampon = L_no_clie_prod_gcc) then
        if (sel_clie_prod%ISOPEN) then
          close sel_clie_prod;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := L_no_clie_prod_gcc;
      end if;
      open sel_clie_prod;
      fetch sel_clie_prod
        into L_bidon;
      exit when sel_clie_prod%NOTFOUND;
      close sel_clie_prod;
    END LOOP;
    if (sel_clie_prod%ISOPEN) then
      close sel_clie_prod;
    end if;
    Return(L_no_clie_prod_gcc);
  Exception
    when sequence_limite then
      /*     raise_application_error(-20204,'IMPOSSIBLE de générer la séquence - '
      ||'Contacter votre vendeur.');   F.L. 21 JAN 2000*/
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_clie_prod%ISOPEN) then
        close sel_clie_prod;
      end if;
      /*      raise_application_error(-20205,'ERREUR dans la FONC_generer_noclie_gcc - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      raise_application_error(-20103,
                              GSY_general_2.FONC_rech_mess('20103', 'GCC'));
  End FONC_generer_noclieprod_gcc;
  Function FONC_generer_norappclie_gcc RETURN number as
    l_no_rapp_clie_gcc gcc_rapp_clie.no_rapp_clie%TYPE;
    cursor sel_rapp_clie is
      select 'x'
        from gcc_rapp_clie GRC
       where GRC.no_rapp_clie = l_no_rapp_clie_gcc;
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_RAPP_CLIE dans la table GCC_RAPP_CLIE */
    LOOP
      select gccs_norappclie.nextval into l_no_rapp_clie_gcc from dual;
      if (L_tampon = l_no_rapp_clie_gcc) then
        if (sel_rapp_clie%ISOPEN) then
          close sel_rapp_clie;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := l_no_rapp_clie_gcc;
      end if;
      open sel_rapp_clie;
      fetch sel_rapp_clie
        into L_bidon;
      exit when sel_rapp_clie%NOTFOUND;
      close sel_rapp_clie;
    END LOOP;
    if (sel_rapp_clie%ISOPEN) then
      close sel_rapp_clie;
    end if;
    Return(l_no_rapp_clie_gcc);
  Exception
    when sequence_limite then
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_rapp_clie%ISOPEN) then
        close sel_rapp_clie;
      end if;
      raise_application_error(-20113,
                              GSY_general_2.FONC_rech_mess('20113', 'GCC'));
  End FONC_generer_norappclie_gcc;
  Function FONC_generer_nonote_gcc RETURN number as
    l_no_note_gcc gcc_note.no_note%TYPE;
    cursor sel_note is
      select 'x' from gcc_note GN where GN.no_note = l_no_note_gcc;
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_note dans la table GCC_note */
    LOOP
      select gccs_nonote.nextval into l_no_note_gcc from dual;
      if (L_tampon = l_no_note_gcc) then
        if (sel_note%ISOPEN) then
          close sel_note;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := l_no_note_gcc;
      end if;
      open sel_note;
      fetch sel_note
        into L_bidon;
      exit when sel_note%NOTFOUND;
      close sel_note;
    END LOOP;
    if (sel_note%ISOPEN) then
      close sel_note;
    end if;
    Return(l_no_note_gcc);
  Exception
    when sequence_limite then
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_note%ISOPEN) then
        close sel_note;
      end if;
      raise_application_error(-20113,
                              GSY_general_2.FONC_rech_mess('20113', 'GCC'));
  End FONC_generer_nonote_gcc;

  --ajout par jgf, le 19/06/02
  Function FONC_gene_noclieprodclie_gcc RETURN number as
    L_no_clie_prod_clie_gcc gcc_clie_prod_clie.no_clie_prod_clie%TYPE;
    Cursor sel_clie_prod_clie is
      Select 'x'
        from gcc_clie_prod_clie GCP
       where GCP.no_clie_prod_clie = L_no_clie_prod_clie_gcc;
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_CLIE_prod_clie dans la table GCC_CLIE_PROD_CLIE */
    LOOP
      select gccs_noclieprodclie.nextval
        into L_no_clie_prod_clie_gcc
        from dual;
      if (L_tampon = L_no_clie_prod_clie_gcc) then
        if (sel_clie_prod_clie%ISOPEN) then
          close sel_clie_prod_clie;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := L_no_clie_prod_clie_gcc;
      end if;
      open sel_clie_prod_clie;
      fetch sel_clie_prod_clie
        into L_bidon;
      exit when sel_clie_prod_clie%NOTFOUND;
      close sel_clie_prod_clie;
    END LOOP;
    if (sel_clie_prod_clie%ISOPEN) then
      close sel_clie_prod_clie;
    end if;
    Return(L_no_clie_prod_clie_gcc);
  Exception
    when sequence_limite then
      /*     raise_application_error(-20204,'IMPOSSIBLE de générer la séquence - '
      ||'Contacter votre vendeur.');   F.L. 21 JAN 2000*/
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_clie_prod_clie%ISOPEN) then
        close sel_clie_prod_clie;
      end if;
      /*      raise_application_error(-20205,'ERREUR dans la FONC_generer_noclie_gcc - '
      ||'Contacter votre vendeur.');  F.L. 21 JAN 2000*/
      raise_application_error(-20103,
                              GSY_general_2.FONC_rech_mess('20103', 'GCC'));
  End FONC_gene_noclieprodclie_gcc;
  ----
  --ajout par jgf, le 17/01/03
  Function FONC_generer_nodoss_gcc RETURN number as

    l_no_doss_gcc gcc_doss.no_doss%TYPE;
    cursor sel_doss is
      select 'x' from gcc_doss GN where GN.no_doss = l_no_doss_gcc;
    --
    sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;
  Begin
    /* Génération d'un NO_note dans la table GCC_note */
    LOOP
      select gccs_nodoss.nextval into l_no_doss_gcc from dual;
      if (L_tampon = l_no_doss_gcc) then
        if (sel_doss%ISOPEN) then
          close sel_doss;
        end if;
        raise sequence_limite;
      end if;
      if (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := l_no_doss_gcc;
      end if;
      open sel_doss;
      fetch sel_doss
        into L_bidon;
      exit when sel_doss%NOTFOUND;
      close sel_doss;
    END LOOP;
    if (sel_doss%ISOPEN) then
      close sel_doss;
    end if;
    Return(l_no_doss_gcc);
  Exception
    when sequence_limite then
      --IMPOSSIBLE de générer la séquence - Contacter votre vendeur.
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      if (sel_doss%ISOPEN) then
        close sel_doss;
      end if;
      --ERREUR dans la FONC_generer_nodoss_gcc - Contacter votre vendeur.
      raise_application_error(-20113,
                              GSY_general_2.FONC_rech_mess('20765', 'GCC'));
  End FONC_generer_nodoss_gcc;

  --par jgf, le 02/07/03
  --génerer la sequence de la table Gcc_clie_prod_rele
  Function FONC_gene_noclieprodrele_gcc RETURN number as

    L_no_clie_prod_rele_gcc gcc_clie_prod_rele.no_clie_prod_rele%TYPE;

    cursor sel_clie_prod_rele is
      select 'x'
        from gcc_clie_prod_rele GCP
       where GCP.no_clie_prod_rele = L_no_clie_prod_rele_gcc;

    Sequence_limite EXCEPTION;
    L_passage char(1) := 'N';
    L_tampon  number := 0;
    L_bidon   char(1) := null;

  Begin
    /* Génération d'un NO_CLIE_prod_rele dans la table GCC_CLIE_PROD_RELE */
    LOOP
      select gccs_noclieprodrele.nextval
        into L_no_clie_prod_rele_gcc
        from dual;
      if (L_tampon = L_no_clie_prod_rele_gcc) then
        if (sel_clie_prod_rele%ISOPEN) then
          close sel_clie_prod_rele;
        end if;
        raise sequence_limite;
      end if;
      If (L_passage = 'N') then
        L_passage := 'O';
        L_tampon  := L_no_clie_prod_rele_gcc;
      End if;
      Open sel_clie_prod_rele;
      Fetch sel_clie_prod_rele
        into L_bidon;
      Exit when sel_clie_prod_rele%NOTFOUND;
      Close sel_clie_prod_rele;
    END LOOP;
    --
    If (sel_clie_prod_rele%ISOPEN) then
      Close sel_clie_prod_rele;
    End if;
    Return(L_no_clie_prod_rele_gcc);

  Exception
    when sequence_limite then
      raise_application_error(-20100,
                              GSY_general_2.FONC_rech_mess('20100', 'GCC'));
    when others then
      If (sel_clie_prod_rele%ISOPEN) then
        Close sel_clie_prod_rele;
      End if;
      raise_application_error(-20103,
                              GSY_general_2.FONC_rech_mess('20103', 'GCC'));
  End FONC_gene_noclieprodrele_gcc;


procedure proc_init_list_chaine is
  l_list_chaine   type_list_chaine;
begin
  --
  list_chaine := l_list_chaine;
end proc_init_list_chaine;
--
Function FONC_MONT_DIST_TRAN_EN_DATE(P_NO_TRAN IN NUMBER, P_EN_DATE IN DATE) return Number as
  --
  L_mont_dist Number;
  --
  Cursor sel_mont_dist is
    Select nvl(sum(montant),0)
           mont_dist
    from
      gcc_dist_paie D
    where
      D.date_tran_paie <= P_en_date and
      D.no_tran_fact   = P_no_tran;
  --
begin
  --
  if nvl(gcc_general.no_tran_dist_prev, 0) != P_no_tran or
     --
     gcc_general.en_date_dist_prev != P_en_date or
     gcc_general.en_date_dist_prev is null then
    --
    open sel_mont_dist;
      fetch sel_mont_dist into L_mont_dist;
    close sel_mont_dist;
    --
    gcc_general.mont_dist_prev := nvl(L_mont_dist,0);
    gcc_general.no_tran_dist_prev   := P_no_tran;
    gcc_general.en_date_dist_prev   := P_en_date;
    --
  else
    L_mont_dist := gcc_general.mont_dist_prev;
  end if;
  return(Nvl(L_mont_dist,0));
End FONC_MONT_DIST_TRAN_EN_DATE;
--
Function Fonc_date_due_mini(P_no_tran in Number) return Date as
  --
  L_date_due Date := Null;
  --
  Cursor sel_date_due is
    Select min(date_du) date_du
      from gcc_mont_term
        where no_tran = P_no_tran;
  --
begin
  open sel_date_due;
    fetch sel_date_due into L_date_due;
  close sel_date_due;
  return(L_date_due);
end Fonc_date_due_mini;
--
Function fonc_cree_tabl_cont(P_no_clie in Number) return type_tabl_cont IS
  --
  l_tabl_cont  type_tabl_cont;
  i            number := 1;
  --
  Cursor sel_cont_clie(c_no_clie number) is
    Select no_cont
      from gcc_pers_cont_clie
     where no_clie = c_no_clie;
  --
begin
  for list_cont in sel_cont_clie(P_no_clie) loop
    l_tabl_cont(i) := list_cont.no_cont;
    i := i+1;
  end loop;
  return(l_tabl_cont);
end fonc_cree_tabl_cont;
--
Procedure proc_effa_pers_cont(P_type_tabl type_tabl_cont, P_no_clie number) is
  --
  i number := null;
  j number := null;
  L_nbre_clie number := null;
  L_no_clie   number := null;
  --
  cursor sel_count_clie(c_no_cont number) is
    Select count(*)
      from gcc_pers_cont_clie
     where no_cont = c_no_cont;
  ---
  Cursor sel_clie(c_no_cont number) is
    Select no_clie
      from gcc_pers_cont
     where no_cont = c_no_cont;
begin
  i := 1;
  j := P_type_tabl.count;
  --t51288
  --if nvl(j,0) != 0 then
  if nvl(j,0) != 0 then
    delete gcc_pers_cont
          where no_clie = P_no_clie;
  end if;
  for k in i .. j loop
    L_nbre_clie := null;
    open sel_count_clie(P_type_tabl(k));
      fetch sel_count_clie into L_nbre_clie;
    close sel_count_clie;
    --
    if nvl(L_nbre_clie,0) = 1 then
      open sel_clie(P_type_tabl(k));
        fetch sel_clie into L_no_clie;
      close sel_clie;
      --
      delete gcc_pers_cont_clie
          where no_clie = P_no_clie
            and no_cont = P_type_tabl(k);
      --
      if nvl(L_no_clie,-9999999) = P_no_clie then
        delete gcc_pers_cont
          where no_clie = P_no_clie
            and no_cont = P_type_tabl(k);
      end if;
    end if;
  end loop;
end proc_effa_pers_cont;
--
  -- La procédure génère de dépôts identique à P_no_depo (si null, tous les dépôts avec mode_gene = O), en date de P_date
  Procedure proc_gene_depo(P_date in date default sysdate, P_no_depo in Number default Null, P_chai_depo out varchar2)is
    --
    L_no_depo  number := null;
    L_desc     varchar2(80) := null;
    L_chai     varchar2(2000) := null;
    --
    Cursor sel_depo (c_no_depo number) is
      Select no_depo, desc_depo, no_comp, no_type_depo, no_hier_orga
        from gcc_depo
       where ((c_no_depo is null and nvl(mode_gene,'N') = 'O') or (c_no_depo is not null and no_depo = c_no_depo));
    --
  Begin
    For enr_depo in sel_depo(P_no_depo) loop
      L_no_depo := null;
      L_no_depo := gcc_general.FONC_generer_nodepo_gcc;
      L_desc := substr(enr_depo.desc_depo,1,62)||' ('||trunc(P_date)||')';
      insert into gcc_depo(no_depo, desc_depo, etat_depo, date_depo, montant, no_comp,
                           no_type_depo,  no_hier_orga, mode_gene)
        values (L_no_depo, L_desc,'O',trunc(P_date),null,enr_depo.no_comp,
                enr_depo.no_type_depo,enr_depo.no_hier_orga, 'N');
      insert into gsy_nom_elem(no_elem,type_elem,code_lang,nom,nom_colo,nom_tabl)
         values (L_no_depo,'DESC',gsy_general.FONC_obte_lang_usag,L_desc,'NO_DEPO','GCC_DEPO');
      ---
      Gsy_general_2.PF_AJOU_DESC_LANG(L_no_Depo, L_desc, 'NO_DEPO','GCC_DEPO',null,83);
      ---
      L_chai := L_chai ||L_no_depo||', ';
    End loop;
    --
    if L_chai is not null and substr(L_chai,length(L_chai)-1,2) = ', ' then
      L_chai := substr(L_chai,1,length(L_chai)-2);
    end if;
    P_chai_depo := L_chai;
  End proc_gene_depo;
  ---
   -- La procédure génère de dépôts identique à P_no_depo (si null, tous les dépôts avec mode_gene = O), en date de P_date
  Procedure proc_gene_depo_pragma(P_date in date default sysdate, P_no_depo in Number default Null, P_chai_depo out varchar2)is
   pragma autonomous_transaction;
   L_chai     varchar2(2000) := null;
  Begin
    proc_gene_depo(P_date => P_date, P_no_depo => P_no_depo, P_chai_depo => L_chai);
    commit;
    P_chai_depo := L_chai;
  End proc_gene_depo_pragma;

End Gcc_general;


