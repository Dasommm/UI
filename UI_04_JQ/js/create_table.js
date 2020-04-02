
function makeTable(elem){   //empRowList()를 가져온다(data의 row들)
    $table = $("<table border=1>"); //document.createElement("<tag>")

    for(var i = 0; i < 1; i++){ // 첫째 줄을 만든다
        $tr = $("<tr>");    //tr태그 만든다
        for(var j = 0; j<elem.eq(0).children().length; j++){ //row의 0번지의 자식요소들의 길이만큼 반복
            $td=$("<td>").append(   //<td> 만든다
                elem.eq(0).children().eq(j).prop("tagName")// 자식들을 돌면서 tagName을 가져온다
            );  //<td> tagName <td>  => append니까 뒤에 붙는다
            $tr.append($td); //td를 tr에 붙이고 
        }
        $table.append($tr); //tr을 table에 붙인다
    }

    for(var i = 0; i<elem.length;i++){ // 둘째 줄 이하 데이터
        $tr = $("<tr>");
        for(var j = 0; j < elem.eq(i).children().length;j++){
            $td = $("<td>").append(
                elem.eq(i).children().eq(j).text()
            );
            $tr.append($td);
        }
        $table.append($tr);
    }
    return $table;

}