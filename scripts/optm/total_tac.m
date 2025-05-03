function tac = total_tac(db)
tac = 0;
for b = db.GetAllBlocks()
    b_type = lower(string(b.Type));
    %disp(b.Name);
    switch b_type
        case "compr"
            tac = tac + COMPRESSOR(db, b);
        case "rcstr"
            tac = tac + CSTR(db, b);
        case "dstwu"
            tac = tac + DSTWU(db, b);
        case "flash2"
            tac = tac + FLASH(db, b);
        case "heater"
            tac = tac + HEATER(db, b);
        case "rplug"
            tac = tac + PFR(db, b);
        case "pump"
            tac = tac + PUMP(db, b);
        case "radfrac"
            tac = tac + RADFRAC(db, b);
    end
end
tac = tac - products_profit(db);
end