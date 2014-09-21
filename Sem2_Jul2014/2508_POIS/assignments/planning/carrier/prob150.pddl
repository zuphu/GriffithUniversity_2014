
(define
	(problem carrier-150)
	(:domain carrier)
	(:objects
		b0
		b1
		b2
		b3
		b4
		b5
		b6
		b7
		b8
		b9
		b10
		b11
		b12
		b13
		b14
		b15
		b16
		b17
		b18
		b19
		b20
		b21
		b22
		b23
		b24
		b25
		b26
		b27
		b28
		b29
		b30
		b31
		b32
		b33
		b34
		b35
		b36
		b37
		b38
		b39
		b40
		b41
		b42
		b43
		b44
		b45
		b46
		b47
		b48
		b49
		b50
		b51
		b52
		b53
		b54
		b55
		b56
		b57
		b58
		b59
		b60
		b61
		b62
		b63
		b64
		b65
		b66
		b67
		b68
		b69
		b70
		b71
		b72
		b73
		b74
		b75
		b76
		b77
		b78
		b79
		b80
		b81
		b82
		b83
		b84
		b85
		b86
		b87
		b88
		b89
		b90
		b91
		b92
		b93
		b94
		b95
		b96
		b97
		b98
		b99
		b100
		b101
		b102
		b103
		b104
		b105
		b106
		b107
		b108
		b109
		b110
		b111
		b112
		b113
		b114
		b115
		b116
		b117
		b118
		b119
		b120
		b121
		b122
		b123
		b124
		b125
		b126
		b127
		b128
		b129
		b130
		b131
		b132
		b133
		b134
		b135
		b136
		b137
		b138
		b139
		b140
		b141
		b142
		b143
		b144
		b145
		b146
		b147
		b148
		b149
			- ball
	)
	(:init
		(robot-at rooma)
		(free left)
		(free right)
		(ball-at b0 rooma)
		(ball-at b1 roomb)
		(ball-at b2 rooma)
		(ball-at b3 rooma)
		(ball-at b4 roomb)
		(ball-at b5 roomb)
		(ball-at b6 roomb)
		(ball-at b7 roomb)
		(ball-at b8 rooma)
		(ball-at b9 rooma)
		(ball-at b10 rooma)
		(ball-at b11 rooma)
		(ball-at b12 rooma)
		(ball-at b13 rooma)
		(ball-at b14 rooma)
		(ball-at b15 rooma)
		(ball-at b16 rooma)
		(ball-at b17 roomb)
		(ball-at b18 rooma)
		(ball-at b19 rooma)
		(ball-at b20 rooma)
		(ball-at b21 rooma)
		(ball-at b22 roomb)
		(ball-at b23 rooma)
		(ball-at b24 roomb)
		(ball-at b25 roomb)
		(ball-at b26 rooma)
		(ball-at b27 roomb)
		(ball-at b28 rooma)
		(ball-at b29 roomb)
		(ball-at b30 rooma)
		(ball-at b31 roomb)
		(ball-at b32 rooma)
		(ball-at b33 rooma)
		(ball-at b34 roomb)
		(ball-at b35 roomb)
		(ball-at b36 rooma)
		(ball-at b37 roomb)
		(ball-at b38 rooma)
		(ball-at b39 roomb)
		(ball-at b40 rooma)
		(ball-at b41 roomb)
		(ball-at b42 roomb)
		(ball-at b43 roomb)
		(ball-at b44 rooma)
		(ball-at b45 roomb)
		(ball-at b46 roomb)
		(ball-at b47 roomb)
		(ball-at b48 roomb)
		(ball-at b49 rooma)
		(ball-at b50 rooma)
		(ball-at b51 rooma)
		(ball-at b52 rooma)
		(ball-at b53 roomb)
		(ball-at b54 roomb)
		(ball-at b55 rooma)
		(ball-at b56 rooma)
		(ball-at b57 roomb)
		(ball-at b58 roomb)
		(ball-at b59 rooma)
		(ball-at b60 roomb)
		(ball-at b61 rooma)
		(ball-at b62 rooma)
		(ball-at b63 roomb)
		(ball-at b64 roomb)
		(ball-at b65 roomb)
		(ball-at b66 rooma)
		(ball-at b67 roomb)
		(ball-at b68 roomb)
		(ball-at b69 rooma)
		(ball-at b70 roomb)
		(ball-at b71 roomb)
		(ball-at b72 roomb)
		(ball-at b73 rooma)
		(ball-at b74 rooma)
		(ball-at b75 rooma)
		(ball-at b76 rooma)
		(ball-at b77 rooma)
		(ball-at b78 roomb)
		(ball-at b79 rooma)
		(ball-at b80 roomb)
		(ball-at b81 rooma)
		(ball-at b82 roomb)
		(ball-at b83 rooma)
		(ball-at b84 roomb)
		(ball-at b85 rooma)
		(ball-at b86 roomb)
		(ball-at b87 rooma)
		(ball-at b88 rooma)
		(ball-at b89 roomb)
		(ball-at b90 roomb)
		(ball-at b91 rooma)
		(ball-at b92 roomb)
		(ball-at b93 roomb)
		(ball-at b94 rooma)
		(ball-at b95 rooma)
		(ball-at b96 roomb)
		(ball-at b97 roomb)
		(ball-at b98 rooma)
		(ball-at b99 rooma)
		(ball-at b100 roomb)
		(ball-at b101 roomb)
		(ball-at b102 roomb)
		(ball-at b103 rooma)
		(ball-at b104 roomb)
		(ball-at b105 roomb)
		(ball-at b106 roomb)
		(ball-at b107 roomb)
		(ball-at b108 rooma)
		(ball-at b109 roomb)
		(ball-at b110 roomb)
		(ball-at b111 roomb)
		(ball-at b112 roomb)
		(ball-at b113 rooma)
		(ball-at b114 roomb)
		(ball-at b115 rooma)
		(ball-at b116 rooma)
		(ball-at b117 rooma)
		(ball-at b118 rooma)
		(ball-at b119 roomb)
		(ball-at b120 rooma)
		(ball-at b121 roomb)
		(ball-at b122 roomb)
		(ball-at b123 roomb)
		(ball-at b124 rooma)
		(ball-at b125 roomb)
		(ball-at b126 rooma)
		(ball-at b127 rooma)
		(ball-at b128 roomb)
		(ball-at b129 roomb)
		(ball-at b130 rooma)
		(ball-at b131 roomb)
		(ball-at b132 rooma)
		(ball-at b133 roomb)
		(ball-at b134 roomb)
		(ball-at b135 rooma)
		(ball-at b136 rooma)
		(ball-at b137 roomb)
		(ball-at b138 rooma)
		(ball-at b139 rooma)
		(ball-at b140 rooma)
		(ball-at b141 rooma)
		(ball-at b142 roomb)
		(ball-at b143 roomb)
		(ball-at b144 roomb)
		(ball-at b145 rooma)
		(ball-at b146 roomb)
		(ball-at b147 rooma)
		(ball-at b148 roomb)
		(ball-at b149 roomb)
	)
	(:goal
		(and
			(ball-at b0 roomb)
			(ball-at b1 rooma)
			(ball-at b2 roomb)
			(ball-at b3 roomb)
			(ball-at b4 rooma)
			(ball-at b5 rooma)
			(ball-at b6 rooma)
			(ball-at b7 rooma)
			(ball-at b8 roomb)
			(ball-at b9 roomb)
			(ball-at b10 roomb)
			(ball-at b11 roomb)
			(ball-at b12 roomb)
			(ball-at b13 roomb)
			(ball-at b14 roomb)
			(ball-at b15 roomb)
			(ball-at b16 roomb)
			(ball-at b17 rooma)
			(ball-at b18 roomb)
			(ball-at b19 roomb)
			(ball-at b20 roomb)
			(ball-at b21 roomb)
			(ball-at b22 rooma)
			(ball-at b23 roomb)
			(ball-at b24 rooma)
			(ball-at b25 rooma)
			(ball-at b26 roomb)
			(ball-at b27 rooma)
			(ball-at b28 roomb)
			(ball-at b29 rooma)
			(ball-at b30 roomb)
			(ball-at b31 rooma)
			(ball-at b32 roomb)
			(ball-at b33 roomb)
			(ball-at b34 rooma)
			(ball-at b35 rooma)
			(ball-at b36 roomb)
			(ball-at b37 rooma)
			(ball-at b38 roomb)
			(ball-at b39 rooma)
			(ball-at b40 roomb)
			(ball-at b41 rooma)
			(ball-at b42 rooma)
			(ball-at b43 rooma)
			(ball-at b44 roomb)
			(ball-at b45 rooma)
			(ball-at b46 rooma)
			(ball-at b47 rooma)
			(ball-at b48 rooma)
			(ball-at b49 roomb)
			(ball-at b50 roomb)
			(ball-at b51 roomb)
			(ball-at b52 roomb)
			(ball-at b53 rooma)
			(ball-at b54 rooma)
			(ball-at b55 roomb)
			(ball-at b56 roomb)
			(ball-at b57 rooma)
			(ball-at b58 rooma)
			(ball-at b59 roomb)
			(ball-at b60 rooma)
			(ball-at b61 roomb)
			(ball-at b62 roomb)
			(ball-at b63 rooma)
			(ball-at b64 rooma)
			(ball-at b65 rooma)
			(ball-at b66 roomb)
			(ball-at b67 rooma)
			(ball-at b68 rooma)
			(ball-at b69 roomb)
			(ball-at b70 rooma)
			(ball-at b71 rooma)
			(ball-at b72 rooma)
			(ball-at b73 roomb)
			(ball-at b74 roomb)
			(ball-at b75 roomb)
			(ball-at b76 roomb)
			(ball-at b77 roomb)
			(ball-at b78 rooma)
			(ball-at b79 roomb)
			(ball-at b80 rooma)
			(ball-at b81 roomb)
			(ball-at b82 rooma)
			(ball-at b83 roomb)
			(ball-at b84 rooma)
			(ball-at b85 roomb)
			(ball-at b86 rooma)
			(ball-at b87 roomb)
			(ball-at b88 roomb)
			(ball-at b89 rooma)
			(ball-at b90 rooma)
			(ball-at b91 roomb)
			(ball-at b92 rooma)
			(ball-at b93 rooma)
			(ball-at b94 roomb)
			(ball-at b95 roomb)
			(ball-at b96 rooma)
			(ball-at b97 rooma)
			(ball-at b98 roomb)
			(ball-at b99 roomb)
			(ball-at b100 rooma)
			(ball-at b101 rooma)
			(ball-at b102 rooma)
			(ball-at b103 roomb)
			(ball-at b104 rooma)
			(ball-at b105 rooma)
			(ball-at b106 rooma)
			(ball-at b107 rooma)
			(ball-at b108 roomb)
			(ball-at b109 rooma)
			(ball-at b110 rooma)
			(ball-at b111 rooma)
			(ball-at b112 rooma)
			(ball-at b113 roomb)
			(ball-at b114 rooma)
			(ball-at b115 roomb)
			(ball-at b116 roomb)
			(ball-at b117 roomb)
			(ball-at b118 roomb)
			(ball-at b119 rooma)
			(ball-at b120 roomb)
			(ball-at b121 rooma)
			(ball-at b122 rooma)
			(ball-at b123 rooma)
			(ball-at b124 roomb)
			(ball-at b125 rooma)
			(ball-at b126 roomb)
			(ball-at b127 roomb)
			(ball-at b128 rooma)
			(ball-at b129 rooma)
			(ball-at b130 roomb)
			(ball-at b131 rooma)
			(ball-at b132 roomb)
			(ball-at b133 rooma)
			(ball-at b134 rooma)
			(ball-at b135 roomb)
			(ball-at b136 roomb)
			(ball-at b137 rooma)
			(ball-at b138 roomb)
			(ball-at b139 roomb)
			(ball-at b140 roomb)
			(ball-at b141 roomb)
			(ball-at b142 rooma)
			(ball-at b143 rooma)
			(ball-at b144 rooma)
			(ball-at b145 roomb)
			(ball-at b146 rooma)
			(ball-at b147 roomb)
			(ball-at b148 rooma)
			(ball-at b149 rooma)
		)
	)
)

