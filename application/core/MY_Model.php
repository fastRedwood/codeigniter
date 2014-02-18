<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

	class MY_Model extends CI_Model
	{   
        //return array
        function fetch($id, $table) {
            $this->db->where('id', $id);
            $query = $this->db->get($table);
            return ($query->num_rows()) ? $query->row_array() : NULL;
        }

        //插入数据，返回新建的该条数据(array) 如果没有自增ID,  返回为0.
        function insert($table, $data)
        {
            $this->db->insert($table, $data);
            $id = $this->db->insert_id();
            return $this->fetch($id, $table);
        }


    	//更新数据，输入数据库名称，更新的数据，条件. 如果更新成功，返回ture,  否则，返回false.
    	function update_a_row($table, $data, $condition)
    	{
			return $this->db->update($table, $data, $condition);
    	}


        /**
            * @Brief    更新多条数据
            *
            * @Param    $table      表名
            * @Param    $data       更新的数据
            * @Param    $condition  限制条件
            *
            * @Return   Bool
         */
        function update_rows($table, $data, $condition)
        {
			return $this->db->update($table, $data, $condition);
        }

    	//从数据库中读取一条或多条数据的标准方法
    	function select_rows($table, $field, $condition, $limit = NULL, $offset = NULL, $orderby = NULL, $sort = NULL, $forcount = FALSE)
    	{
    		$this->db->select($field, FALSE);
    		if ($condition != NULL) $this->db->where($condition);
    		if ($orderby != NULL) $this->db->order_by($orderby, $sort);
    		if ($forcount == TRUE) return $this->db->count_all_results($table);
    		else return $this->db->get($table, $limit, $offset);
    	}

    	//将几个数据库连接起来做联合查询
    	function select_rows_with_join($table, $fields=NULL, $join, $condition, $limit, $offset, $orderby, $sort, $forcount)
    	{
            if (is_array($fields))
            {
                foreach ($fields as $t => $values)
                {
                    foreach ($values as $field)
                    {
                        $fields_arr[] = $t . '.' . $field;
                    }
                }
                $fields = implode(',', $fields_arr);
                $this->db->select($fields);
            }
            else
            {
    		    $this->db->select('*');
            }

    		foreach($join as $value=>$key){$this->db->join($value, $key);}
    		if($condition != null) $this->db->where($condition);
    		if($orderby != null) $this->db->order_by($orderby, $sort);
    		if($forcount == TRUE) return $this->db->count_all_results($table);
    		else return $this->db->get($table, $limit, $offset);
    	}

    	//删除数据，输入要删除的数据库名称，条件. 如果删除成功，返回true.
    	function delete_a_row($table, $condition)
    	{
    		return $this->db->delete($table, $condition);
    	}


        /**
            * @Brief    删除多条数据
            *
            * @Param    $table      表名
            * @Param    $condition  限制条件
            *
            * @Return   Bool
         */
        function delete_rows($table, $condition)
        {
            return $this->db->delete($table, $condition);
        }

	}
?>
