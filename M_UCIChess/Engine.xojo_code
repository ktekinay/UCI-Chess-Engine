#tag Class
Protected Class Engine
	#tag Method, Flags = &h0
		Sub Constructor(uciEngine As FolderItem)
		  UCI = new Shell
		  UCI.Mode = 2
		  AddHandler UCI.DataAvailable, WeakAddressOf UCI_DataAvailable
		  
		  UCI.Execute uciEngine.ShellPath
		  if UCI.ErrorCode <> 0 then
		    dim err as new UCIEngineException("Could not start UCI engine", CurrentMethodName)
		    raise err
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  if UCI isa object then
		    RemoveHandler UCI.DataAvailable, WeakAddressOf UCI_DataAvailable
		    UCI.Close
		    UCI = nil
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UCI_DataAvailable(sh As Shell)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private UCI As Shell
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UCI"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
